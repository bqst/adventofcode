const path = require('path')
const fs = require('fs')

const rounds = fs
  .readFileSync(path.join(__dirname, 'input.txt'), 'utf8')
  .toString()
  .trim()
  .split('\n')
  .map((line) => line.replace(/\s/g, ''))

// A/X (Rock): 1, B/Y (Paper): 2, C/Z (Scissors): 3
const SHAPE_SCORES = {
  1: ['A', 'X'],
  2: ['B', 'Y'], 
  3: ['C', 'Z']
}

const getShapeScore = (shape) => {
  return parseInt(Object.keys(SHAPE_SCORES).find((key) => SHAPE_SCORES[key].includes(shape)))
}

// Rock beats Scissors / Scissors beats Paper / Paper beats Rock
const score = rounds.reduce((acc, round) => {
  const shape_score = getShapeScore(round[1])
  if (['AY', 'BZ', 'CX'].includes(round)) return acc + 6 + shape_score
  if (['AX', 'BY', 'CZ'].includes(round)) return acc + 3 + shape_score
  return acc + shape_score
}, 0)

console.log(score)

// Y means Draw, X means Lose, Z means Win
const total_score = rounds.reduce((acc, round) => {  
  if (['AY', 'BY', 'CY'].includes(round)) return acc + 3 + getShapeScore(round[0])
  if (['AX', 'BX', 'CX'].includes(round)) return acc + (getShapeScore(round[0]) + 1) % 3 + 1
  return acc + 6 + (getShapeScore(round[0]) % 3) + 1
}, 0)

console.log(total_score)
