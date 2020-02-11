package main

import (
	"io"
	"log"
	"net/http"
	"os"
	"text/template"
	"time"
)

var loger *log.Logger

func init() {
	f, err := os.OpenFile("text.log",
		os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Println(err)
	}

	loger = log.New(f, "prefix", log.LstdFlags)
}

func index(w http.ResponseWriter, r *http.Request) {
	t, _ := template.ParseFiles("views/index.html") //加载模板文件
	t.Execute(w, nil)                               //模板文件显示在页面上
	// fmt.Fprintf(w,"<h1>go web</h1>")  //直接显示在页面上
}

func main() {
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	http.HandleFunc("/forruirui", index)
	http.HandleFunc("/build", handleBuild)
	http.ListenAndServe(":7777", nil)
}

func handleBuild(w http.ResponseWriter, r *http.Request) {
	io.WriteString(w, "Building...")
	loger.Println("Build at: ", time.Now())
}
