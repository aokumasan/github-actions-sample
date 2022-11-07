package main

import (
	"fmt"

	"github.com/nifcloud/nifcloud-sdk-go/nifcloud"
)

func main() {
	fmt.Println("Hello, GitHub!")
	nif()
}

func nif() {
	_ = nifcloud.NewConfig(
		"YOUR_ACCESS_KEY_ID",
		"YOUR_SECRET_ACCESS_KEY",
		"jp-east-1",
	)
}
