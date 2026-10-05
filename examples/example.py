from dataclasses import dataclass
from typing import List, Dict
import math
import asyncio

# constants
APP_NAME: str = "Clarity"
PI: float = 3.1415926535
MAX_RESULTS: int = 10


def clamp(value: float, minimum: float, maximum: float) -> float:
    """Clamp a value between a minimum and maximum."""
    if value < minimum:
        return minimum
    elif value > maximum:
        return maximum
    return value


@dataclass
class Vector:
    x: float
    y: float

    def length(self) -> float:
        return math.sqrt(self.x ** 2 + self.y ** 2)

    def normalize(self) -> "Vector":
        length = self.length()
        if length == 0:
            return Vector(0, 0)
        return Vector(self.x / length, self.y / length)


class DataProcessor:
    def __init__(self, values: List[int]) -> None:
        self.values = values

    def process(self) -> List[Dict[str, int | str]]:
        results: List[Dict[str, int | str]] = []

        for index, number in enumerate(self.values):
            squared = number ** 2
            limited = clamp(squared, 0, 100)

            if limited > 50:
                status = "large"
            else:
                status = "small"

            results.append({
                "index": index,
                "value": limited,
                "status": status
            })

        return results


def summarize(data: List[Dict[str, int | str]]) -> Dict[str, int]:
    summary: Dict[str, int] = {"large": 0, "small": 0}

    for item in data:
        status = item["status"]
        if status in summary:
            summary[status] += 1

    return summary


async def fake_api_call(delay: float) -> str:
    """Simulate an async API request."""
    await asyncio.sleep(delay)
    return f"Finished after {delay} seconds"


async def run_async_tasks():
    tasks = [
        fake_api_call(0.5),
        fake_api_call(1.0),
        fake_api_call(0.2),
    ]

    results = await asyncio.gather(*tasks)

    for result in results:
        print("API:", result)


def main() -> None:
    numbers = [1, 4, 7, 12, 20, 3, 9]

    processor = DataProcessor(numbers)
    processed = processor.process()

    summary = summarize(processed)

    print(f"=== {APP_NAME} Test ===")
    print("Processed:", processed)
    print("Summary:", summary)

    v = Vector(10, 20)
    normalized = v.normalize()

    print("Vector length:", v.length())
    print("Normalized:", normalized)

    try:
        value = int("not_a_number")
        print(value)
    except ValueError as error:
        print("Caught error:", error)

    # list comprehension
    doubled = [x * 2 for x in numbers if x > 5]

    print("Doubled:", doubled)


if __name__ == "__main__":
    asyncio.run(run_async_tasks())
    main()
