const events = require('events');
const fs = require('fs');
const readline = require('readline');


(async function processLineByLine() {
  let elfNumber = 0
  const caloriesBag = [0, 0, 0]
  const insertBiggest = (input) => {
    const newEntryIndex = caloriesBag.findIndex(currentCalories => input > currentCalories)
    if (newEntryIndex > -1) {
      caloriesBag[newEntryIndex] = input
      caloriesBag.sort((a,b) => a >b ? 1: -1)
    }
  }
  try {
    const rl = readline.createInterface({
      input: fs.createReadStream('./input.txt'),
      crlfDelay: Infinity
    });

    rl.on('line', (line) => {
      // console.log(line, elfNumber)
      if (line === "") {
        // elfNumber++
        // caloriesBag[elfNumber] = 0
      } else {
        // caloriesBag[elfNumber] = caloriesBag[elfNumber] + parseInt(line, 10)
        insertBiggest(parseInt(line, 10))
        console.log(caloriesBag)
        // caloriesBag[elfNumber] = caloriesBag[elfNumber] + parseInt(line, 10)
      }
    });

    await events.once(rl, 'close');

    console.log('Reading file line by line with readline done.', caloriesBag.reduce((acc, item) => acc + item , 0));

  } catch (err) {
    console.error(err);
  }
})();