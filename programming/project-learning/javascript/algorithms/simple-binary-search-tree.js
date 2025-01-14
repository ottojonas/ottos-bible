const data = ["A", "+", "B", "*", "C", "/", "D", "-", "E"];

const left = [null, 0, null, 2, null, 1, null, 6, null];
const right = [null, 3, null, 4, null, 7, null, 8, null];

const root = 5;

function P(T) {
    if (left[T] !== null) {
        P(left[T]);
    }
    if (right[T] !== null) {
        P(right[T]);
    }
    console.log(data[T]);
}

P(root);