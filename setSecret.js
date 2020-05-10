const core = require('@actions/core');
const fs = require('fs');

function run() {
  var myArgs = process.argv.slice(2);
  const fileName = myArgs[0]

  try {
    // read contents of the file
    const data = fs.readFileSync(fileName, 'UTF-8');

    // split the contents by new line
    const lines = data.split(/\r?\n/);

    for(var i=0; i<lines.length;i++) {
      var line = lines[i].split('=',2)
      if(line[0]) {
        core.exportVariable(line[0], line[1]);
        core.setSecret(line[1]);
      }
    }
  } catch (err) {
      console.error(err);
  }
}

module.exports = run;

/* istanbul ignore next */
if (require.main === module) {
  run();
}