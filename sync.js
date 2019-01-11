// Assigning modules to local variables
var fs = require("fs");
var request = require("request");
var async = require("async");
require("dotenv").config();
var SERVERLESS_PLUGINS = "_data/serverless_plugins.json";

// WE START HERE AND GIT A BUNCH OF CALLBACKS
request(
  "https://raw.githubusercontent.com/serverless/plugins/master/plugins.json",
  parseAndFetchRepoInfo
);

function parseAndFetchRepoInfo(err, httpResponse, body) {
  return async.map(JSON.parse(body), getRepoInfo, asyncDone);
}

function getRepoInfo(plugin, callback) {
  console.log(
    `https://api.npmjs.org/downloads/point/last-month/${plugin.name}`
  );
  request(
    `https://api.npmjs.org/downloads/point/last-month/${plugin.name}`,
    function(err, resp, last_month_data) {
      if (err) {
        console.log(err);
        callback(null, Object.assign(plugin, { "last-month": 0 }));
      } else {
        var newDat = Object.assign(plugin, {
          "last-month": JSON.parse(last_month_data).downloads || 0
        });
        return callback(null, newDat);
      }
    }
  );
}

function getRepoStart(plugin, callback) {
  request(`https://registry.npmjs.org/${plugin.name}`, function(
    err,
    resp,
    raw_d
  ) {
    var registry_data = JSON.parse(raw_d);
    console.log(registry_data);
    callback(
      null,
      Object.assign(plugin, {
        created: (registry_data.time && registry_data.time.created) || null
      })
    );
  });
}

function asyncDone(e, plugins) {
  if (e) {
    console.log(e);
  } else {
    fs.writeFile(
      SERVERLESS_PLUGINS,
      JSON.stringify(plugins, null, 2),
      "utf8",
      function() {
        console.log("done");
      }
    );
  }
}

// gulp.task('consultants', function() {
//   require('./_data/consultants.json').forEach(createFile);
// });

function createFile(filedat) {
  const coname = filedat.url
    .split("://")[1]
    .replace("www.", "")
    .split(".")[0];

  const filename = `./_consultants/${coname}.md`;

  const data = `---\ntitle: ${
    filedat.title
  }\nlayout: redirect\nnote: THIS FILE IS GENERATED AUTOMATICALLY, EDIT _data/consultants.json instead \nredirect_to:\n  - ${
    filedat.url
  } \n---`;

  fs.unlinkSync(filename);
  fs.open(filename, "r", function(err, fd) {
    if (err) {
      fs.writeFile(filename, data, function(err) {
        if (err) {
          console.log(err);
        }
        console.log("The file was saved!");
      });
    } else {
      console.log("The file exists!");
    }
  });
}
