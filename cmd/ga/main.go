package main

import (
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("./../static"))
	http.Handle("/", fs)

	log.Println("Listening on :443...")
	err := http.ListenAndServeTLS(":443", "server.crt", "server.key", nil)
	if err != nil {
		log.Fatal(err)
	}
}
