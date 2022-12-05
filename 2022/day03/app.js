const path = require('path')
const fs = require('fs')

const input = fs
  .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
  .toString()
  .trim()
  .split('\n')

const rucksacks = input.map((rucksack) => {
  const split_index = Math.floor(rucksack.length / 2)
  return [rucksack.slice(0, split_index), rucksack.slice(split_index)]
})

const common_items = rucksacks.reduce((acc, rucksack) => {
  const [compartment1, compartment2] = rucksack
  const common_item = compartment1.split('').find((item) => compartment2.includes(item))
  return [...acc, ...common_item]
}, [])

const getScore = (items) => {
  return items.reduce((acc, item) => {
    const priority = item === item.toUpperCase() ? item.charCodeAt(0) - 'A'.charCodeAt(0) + 27 : item.charCodeAt(0) - 'a'.charCodeAt(0) + 1
    console.log(item, priority)
    return acc + priority
  }, 0)
}

const score = getScore(common_items)

console.log(score)

// Part 2
const group = (array, n) => 
  [...Array(Math.ceil(array.length / n))]
    .map((el, i) => array.slice(i * n, (i + 1) * n));

// Every set of three lines in your list corresponds to a single group
const rucksacks_groups = group(input, 3)

const common_items_groups = rucksacks_groups.reduce((acc, rucksack_group) => {
  const [compartment1, compartment2, compartment3] = rucksack_group
  const common_item = compartment1.split('').find((item) => compartment2.includes(item) && compartment3.includes(item))
  return [...acc, ...common_item]
}, [])

const score_groups = getScore(common_items_groups)

console.log(score_groups)