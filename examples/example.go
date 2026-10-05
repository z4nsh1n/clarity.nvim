package main

import (
	"encoding/json"
	"fmt"
	"math"
	"sync"
	"time"
)

// constants
const APP_NAME string = "Clarity"
const MAX_RESULTS int = 10

// custom error
type ProcessingError struct {
	Message string
}

func (e ProcessingError) Error() string {
	return fmt.Sprintf("processing error: %s", e.Message)
}

// struct example
type Vector struct {
	X float64
	Y float64
}

func (v Vector) Length() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func (v Vector) Normalize() Vector {
	length := v.Length()
	if length == 0 {
		return Vector{0, 0}
	}
	return Vector{v.X / length, v.Y / length}
}

// interface example
type Processor interface {
	Process([]int) ([]Result, error)
}

// struct implementing interface
type NumberProcessor struct{}

type Result struct {
	Index  int    `json:"index"`
	Value  int    `json:"value"`
	Status string `json:"status"`
}

func clamp(value, min, max int) int {
	if value < min {
		return min
	}
	if value > max {
		return max
	}
	return value
}

func (p NumberProcessor) Process(numbers []int) ([]Result, error) {
	results := []Result{}

	for i, num := range numbers {
		squared := num * num
		limited := clamp(squared, 0, 100)

		status := "small"
		if limited > 50 {
			status = "large"
		}

		results = append(results, Result{
			Index:  i,
			Value:  limited,
			Status: status,
		})
	}

	if len(results) == 0 {
		return nil, ProcessingError{"no results generated"}
	}

	return results, nil
}

// generic function
func Map[T any, R any](items []T, fn func(T) R) []R {
	result := make([]R, len(items))
	for i, v := range items {
		result[i] = fn(v)
	}
	return result
}

// goroutine example
func fakeAPI(delay time.Duration, wg *sync.WaitGroup, ch chan<- string) {
	defer wg.Done()

	time.Sleep(delay)
	ch <- fmt.Sprintf("finished after %v", delay)
}

// JSON example
func toJSON(v any) string {
	bytes, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		return "{}"
	}
	return string(bytes)
}

func main() {

	numbers := []int{1, 4, 7, 12, 20, 3, 9}

	processor := NumberProcessor{}
	results, err := processor.Process(numbers)

	if err != nil {
		fmt.Println("error:", err)
		return
	}

	fmt.Printf("=== %s Test ===\n", APP_NAME)
	fmt.Println("results:", toJSON(results))

	// vector test
	v := Vector{X: 10, Y: 20}
	n := v.Normalize()

	fmt.Println("vector length:", v.Length())
	fmt.Println("normalized:", n)

	// generics test
	doubled := Map(numbers, func(n int) int {
		return n * 2
	})

	fmt.Println("doubled:", doubled)

	// concurrency test
	var wg sync.WaitGroup
	ch := make(chan string, 3)

	delays := []time.Duration{
		200 * time.Millisecond,
		400 * time.Millisecond,
		100 * time.Millisecond,
	}

	for _, d := range delays {
		wg.Add(1)
		go fakeAPI(d, &wg, ch)
	}

	wg.Wait()
	close(ch)

	for msg := range ch {
		fmt.Println("api:", msg)
	}
}
