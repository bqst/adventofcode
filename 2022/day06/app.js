const path = require('path')
const fs = require('fs')

const input = fs
  .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
  .toString()
  .split('')

const findMarker = (input, size) => {
  return input.findIndex((_, index, arr) => {
    return arr.slice(index, index + size).filter((value, idx, a) => a.indexOf(value) === idx).length === size
  }) + size;
}

console.log('Part #1', findMarker(input, 4))
console.log('Part #2', findMarker(input, 14))