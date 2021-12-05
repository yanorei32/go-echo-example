package cmd

import (
	"github.com/labstack/echo/v4"
)

func AttachRouters(e *echo.Echo) {
	e.GET("/", Index)
}
