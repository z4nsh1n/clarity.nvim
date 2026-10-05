// constants
const APP_NAME = "Clarity";
const MAX_RESULTS = 10;

// utility function
function clamp(value, min, max) {
    if (value < min) return min;
    if (value > max) return max;
    return value;
}

// class example
class Vector {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
    }

    length() {
        return Math.sqrt(this.x ** 2 + this.y ** 2);
    }

    normalize() {
        const len = this.length();

        if (len === 0) {
            return new Vector(0, 0);
        }

        return new Vector(this.x / len, this.y / len);
    }
}

// array processing
function processNumbers(numbers) {
    const results = [];

    for (let i = 0; i < numbers.length; i++) {
        const num = numbers[i];
        const squared = num ** 2;
        const limited = clamp(squared, 0, 100);

        const status = limited > 50 ? "large" : "small";

        results.push({
            index: i,
            value: limited,
            status: status
        });
    }

    return results;
}

// destructuring example
function summarize(data) {
    const summary = { large: 0, small: 0 };

    for (const { status } of data) {
        if (summary[status] !== undefined) {
            summary[status]++;
        }
    }

    return summary;
}

// async example
async function fakeApiCall(delay) {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve(`Finished after ${delay}ms`);
        }, delay);
    });
}

async function runAsyncTasks() {
    const tasks = [
        fakeApiCall(200),
        fakeApiCall(500),
        fakeApiCall(100)
    ];

    const results = await Promise.all(tasks);

    results.forEach(result => {
        console.log("API:", result);
    });
}

// arrow functions
const double = (x) => x * 2;

const numbers = [1, 4, 7, 12, 20, 3, 9];
const doubled = numbers.map(double).filter(x => x > 10);

// object example
const config = {
    name: APP_NAME,
    version: "1.0.0",
    enabled: true,
    tags: ["theme", "editor", "clarity"]
};

// try / catch example
try {
    const result = JSON.parse("{ invalid json }");
    console.log(result);
} catch (error) {
    console.error("Caught error:", error.message);
}

// main program
function main() {
    const processorResults = processNumbers(numbers);
    const summary = summarize(processorResults);

    console.log(`=== ${APP_NAME} Test ===`);
    console.log("Processed:", processorResults);
    console.log("Summary:", summary);

    const v = new Vector(10, 20);
    const normalized = v.normalize();

    console.log("Vector length:", v.length());
    console.log("Normalized:", normalized);
}

runAsyncTasks();
main();
