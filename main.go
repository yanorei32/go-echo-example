package main

import (
	"github.com/yanorei32/go-echo-example/cmd"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	cmd.AttachRouters(e)

	e.Logger.Fatal(e.Start(":1323"))
}
