const path = require('path')
const fs = require('fs')

const input = fs
  .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
  .toString()

Array.prototype.transpose = function () {
  return this[0].map((_, i) => this.map(row => row[i]))
}

const [stacks_input, moves_input] = input.split('\n\n')

const initial_stacks = stacks_input.split('\n')
  .map(line => [...line].filter((_, index) => index % 4 === 1))
  .reverse()
  .transpose()
  .map(stack => stack.filter(crate => crate !== ' ' && crate !== undefined))

const instructions = moves_input.split('\n').map((instruction) => {
  const [, move, from, to] = instruction.match(/^move (\d+) from (\d+) to (\d+)$/).map(Number)
  return [move, from, to]
})

const part1 = (stacks, instructions) => {
  stacks = stacks.map(stack => [...stack]) // avoid mutating the original stacks
  for (let [count, from, to] of instructions) {
    for (let i = 1; i <= count; i++) {
      stacks[to - 1].push(stacks[from - 1].pop())
    }
  }
  return stacks
    .map(stack => stack.at(-1))
    .join('')
}

const part2 = (stacks, instructions) => {
  stacks = stacks.map(stack => [...stack]) // avoid mutating the original stacks
  for (let [count, from, to] of instructions) {
    stacks[to - 1].push(...stacks[from - 1].splice(-count))
  }
  return stacks
    .map(stack => stack.at(-1))
    .join('')
}

console.log('Message part #1', part1(initial_stacks, instructions))
console.log('Message part #2', part2(initial_stacks, instructions))