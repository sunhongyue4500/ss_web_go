package main

import (
	"net/http"
	"text/template"
)

func index(w http.ResponseWriter, r *http.Request) {
	t, _ := template.ParseFiles("views/index.html") //加载模板文件
	t.Execute(w, nil)                               //模板文件显示在页面上
	// fmt.Fprintf(w,"<h1>go web</h1>")  //直接显示在页面上
}

func main() {
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	http.HandleFunc("/forruirui", index)
	http.ListenAndServe(":7777", nil)
}
