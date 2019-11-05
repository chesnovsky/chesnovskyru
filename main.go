package main

import (
	"fmt"
	"html/template"
	"net/http"
	"time"
)

const (
	Port = ":8080"
)

type IndexPage struct {
	Year int
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	p := IndexPage{Year: time.Now().Year()}
	t, err := template.ParseFiles("index.html")
	if err != nil {
		fmt.Println(err)
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	t.Execute(w, p)
}

func main() {
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))
	http.HandleFunc("/", indexHandler)
	http.ListenAndServe(Port, nil)
}
