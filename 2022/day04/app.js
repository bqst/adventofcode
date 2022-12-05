const path = require('path')
const fs = require('fs')

const input = fs
  .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
  .toString()
  .trim()
  .split('\n')

const assignments = input.map((assignment) => assignment.split(','))

const sections = assignments.map((assignment) => {
  return assignment.map((range) => {
    const [start, end] = range.split('-')
    return [parseInt(start), parseInt(end)]
  })
})

const fully_contain_count = sections.reduce((acc, section) => {
  const [first_range, second_range] = section
  const [first_start, first_end] = first_range
  const [second_start, second_end] = second_range

  if ((first_start >= second_start && first_end <= second_end) 
    || (second_start >= first_start && second_end <= first_end)) 
    return acc + 1

  return acc
}, 0)

console.log(fully_contain_count)

// Part 2
const overlap_count = sections.reduce((acc, section) => {
  const [first_range, second_range] = section
  const [first_start, first_end] = first_range
  const [second_start, second_end] = second_range

  if ((first_start >= second_start && first_start <= second_end) 
    || (second_start >= first_start && second_start <= first_end)) 
    return acc + 1

  return acc
}, 0)

console.log(overlap_count)