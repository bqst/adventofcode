const path = require('path')
const fs   = require('fs')

const input = fs
        .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
        .toString()
        .trim()
        .split('\n')
        .map((line) => parseInt(line, 10))

const groups = input.reduce((acc, curr) => {
  Number.isNaN(curr) ? acc.push([]) : acc[acc.length - 1].push(curr)
  return acc
}, [[]])

const sums = groups.map((group) => group.reduce((acc, curr) => acc + curr, 0))

// Part 1
const max = sums.reduce((acc, curr) => Math.max(acc, curr), 0)
console.log(max)

// Part 2
const top3 = sums
  .map((sum, index) => ({ sum, index }))
  .sort((a, b) => b.sum - a.sum)
  .slice(0, 3)
  .reduce((acc, curr) => acc + curr.sum, 0)
console.log(top3)
