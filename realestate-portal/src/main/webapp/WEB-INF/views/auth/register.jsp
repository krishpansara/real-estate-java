<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <style>
 @import url("https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css");
* {
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}
html,
body {
  margin: 0px;
  height: 100%;
}
/* a blue color as a generic focus style */
button:focus-visible {
  outline: 2px solid #4a90e2 !important;
  outline: -webkit-focus-ring-color auto 5px !important;
}
a {
  text-decoration: none;
}
:root {
  --d-h1-font-family: "Merriweather", Helvetica;
  --d-h1-font-weight: 700;
  --d-h1-font-size: 64.8499984741211px;
  --d-h1-letter-spacing: 0px;
  --d-h1-line-height: 120.00000476837158%;
  --d-h1-font-style: normal;
  --d-p-font-family: "Open Sans", Helvetica;
  --d-p-font-weight: 400;
  --d-p-font-size: 17px;
  --d-p-letter-spacing: 0px;
  --d-p-line-height: 150%;
  --d-p-font-style: normal;
  --d-p-bold-font-family: "Open Sans", Helvetica;
  --d-p-bold-font-weight: 700;
  --d-p-bold-font-size: 17px;
  --d-p-bold-letter-spacing: 0px;
  --d-p-bold-line-height: 150%;
  --d-p-bold-font-style: normal;
  --real-estate-color-white: rgba(255, 255, 255, 1);
  --real-estate-color-dark-blue: rgba(9, 22, 56, 1);
  --real-estate-color-dark-gray: rgba(136, 143, 159, 1);
  --real-estate-color-blue: rgba(28, 57, 136, 1);
}

/*

To enable a theme in your HTML, simply add one of the following data attributes to an HTML element, like so:

<body data-real-estate-mode="blue">
    <!-- the rest of your content -->
</body>

You can apply the theme on any DOM node, not just the `body`

*/

[data-real-estate-mode="blue"] {
  --real-estate-color-dark-blue: rgba(9, 22, 56, 1);
  --real-estate-color-dark-gray: rgba(136, 143, 159, 1);
  --real-estate-color-blue: rgba(28, 57, 136, 1);
}

[data-real-estate-mode="red"] {
  --real-estate-color-dark-blue: rgba(45, 41, 38, 1);
  --real-estate-color-dark-gray: rgba(158, 136, 143, 1);
  --real-estate-color-blue: rgba(228, 0, 70, 1);
}

[data-real-estate-mode="turquoise"] {
  --real-estate-color-dark-blue: rgba(38, 45, 45, 1);
  --real-estate-color-dark-gray: rgba(136, 158, 157, 1);
  --real-estate-color-blue: rgba(23, 194, 177, 1);
}

.d-signup {
  background-color: var(--real-estate-color-white);
  width: 100%;
  min-width: 1440px;
  min-height: 832px;
  position: relative;
}

.d-signup .button {
  display: flex;
  width: 1200px;
  align-items: center;
  justify-content: space-between;
  position: absolute;
  top: calc(50.00% - 248px);
  left: calc(50.00% - 575px);
}

.d-signup .container {
  display: flex;
  flex-direction: column;
  width: 545px;
  height: 544px;
  align-items: center;
  justify-content: space-between;
  position: relative;
}

.d-signup .paragraph-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 8px;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.d-signup .don-t-have-an {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  align-self: stretch;
  height: 176px;
  margin-top: -1.00px;
  font-family: var(--d-h1-font-family);
  font-weight: var(--d-h1-font-weight);
  color: var(--real-estate-color-dark-blue);
  font-size: var(--d-h1-font-size);
  letter-spacing: var(--d-h1-letter-spacing);
  line-height: var(--d-h1-line-height);
  font-style: var(--d-h1-font-style);
}

.d-signup .segmented-picker {
  flex-direction: column;
  align-items: flex-start;
  gap: 8px;
  border-radius: 4px;
  display: flex;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.d-signup .input-wrapper {
  align-items: center;
  gap: 16px;
  display: flex;
  position: relative;
  align-self: stretch;
  width: 100%;
  flex: 0 0 auto;
}

.d-signup .input {
  display: flex;
  height: 56px;
  align-items: center;
  gap: 16px;
  padding: 0px 16px;
  position: relative;
  flex: 1;
  flex-grow: 1;
  background-color: var(--real-estate-color-white);
  border-radius: 4px;
  border: 1px solid;
  border-color: var(--real-estate-color-dark-gray);
  box-shadow: inset 0px 1px 5px #0000001a;
}

.d-signup .img-wrapper {
  position: relative;
  width: 24px;
  height: 24px;
  background-color: #ffffff;
}

.d-signup .img {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.d-signup .search-of-location {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  flex: 1;
  font-family: var(--d-p-font-family);
  font-weight: var(--d-p-font-weight);
  color: var(--real-estate-color-dark-gray);
  font-size: var(--d-p-font-size);
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  font-style: var(--d-p-font-style);
}

.d-signup .div-wrapper {
  display: flex;
  height: 56px;
  align-items: center;
  gap: 16px;
  position: relative;
  align-self: stretch;
  width: 100%;
}

.d-signup .div {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  flex: 1;
  font-family: var(--d-p-font-family);
  font-weight: var(--d-p-font-weight);
  color: var(--real-estate-color-dark-gray);
  font-size: var(--d-p-font-size);
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  font-style: var(--d-p-font-style);
  background: transparent;
  border: none;
  padding: 0;
}

.d-signup .button-2 {
  all: unset;
  box-sizing: border-box;
  display: flex;
  width: 257px;
  align-items: flex-start;
  justify-content: center;
  gap: 8px;
  padding: 14px 16px;
  position: relative;
  flex: 0 0 auto;
  background-color: #17c2b1;
  border-radius: 4px;
}

.d-signup .primary-button {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  width: fit-content;
  margin-top: -1.00px;
  font-family: var(--d-p-bold-font-family);
  font-weight: var(--d-p-bold-font-weight);
  color: var(--real-estate-color-white);
  font-size: var(--d-p-bold-font-size);
  text-align: center;
  letter-spacing: var(--d-p-bold-letter-spacing);
  line-height: var(--d-p-bold-line-height);
  white-space: nowrap;
  font-style: var(--d-p-bold-font-style);
}

.d-signup .already-have-an {
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  align-self: stretch;
  font-family: var(--d-p-font-family);
  font-weight: var(--d-p-font-weight);
  color: var(--real-estate-color-dark-gray);
  font-size: var(--d-p-font-size);
  text-align: center;
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  font-style: var(--d-p-font-style);
}

.d-signup .text-wrapper {
  color: #888f9f;
  font-family: var(--d-p-font-family);
  font-style: var(--d-p-font-style);
  font-weight: var(--d-p-font-weight);
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  font-size: var(--d-p-font-size);
}

.d-signup .span {
  color: #1c3988;
  font-family: var(--d-p-font-family);
  font-style: var(--d-p-font-style);
  font-weight: var(--d-p-font-weight);
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  font-size: var(--d-p-font-size);
}

.d-signup .container-wrapper {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  gap: 8px;
  position: relative;
  flex: 1;
  flex-grow: 1;
}

.d-signup .container-2 {
  position: relative;
  width: 595px;
  height: 544px;
}

.d-signup .top-menu {
  display: flex;
  flex-direction: column;
  width: 1440px;
  height: 120px;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 8px;
  position: absolute;
  top: 0;
  left: 0;
}

.d-signup .navbar {
  display: flex;
  width: 1200px;
  align-items: center;
  justify-content: space-between;
  position: relative;
  flex: 0 0 auto;
}

.d-signup .horizontal-container {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 8px;
  position: relative;
  flex: 1;
  flex-grow: 1;
}

.d-signup .logo {
  display: inline-flex;
  align-items: center;
  gap: 16px;
  position: relative;
  flex: 0 0 auto;
}

.d-signup .logo-2 {
  position: relative;
  width: 64.84px;
  height: 40px;
}

.d-signup .real-estate {
  position: relative;
  width: 120px;
  height: 18.82px;
}

.d-signup .horizontal-container-2 {
  display: inline-flex;
  align-items: center;
  justify-content: flex-end;
  gap: 32px;
  position: relative;
  flex: 0 0 auto;
}

.d-signup .paragraph-container-2 {
  display: inline-flex;
  align-items: center;
  gap: 32px;
  padding: 6px 0px;
  position: relative;
  flex: 0 0 auto;
}

.d-signup .text-wrapper-2 {
  position: relative;
  width: fit-content;
  margin-top: -1.00px;
  font-family: var(--d-p-font-family);
  font-weight: var(--d-p-font-weight);
  color: var(--real-estate-color-dark-blue);
  font-size: var(--d-p-font-size);
  letter-spacing: var(--d-p-letter-spacing);
  line-height: var(--d-p-line-height);
  white-space: nowrap;
  font-style: var(--d-p-font-style);
}


    </style>
  </head>
  <body>
    <div class="d-signup">
      <div class="button">
        <div class="container">
          <div class="paragraph-container"><div class="don-t-have-an">Don’t Have an&nbsp;&nbsp;Account?</div></div>
          <div class="segmented-picker">
            <div class="input-wrapper">
              <div class="input">
                <div class="img-wrapper"><img class="img" src="img/icon_1.png" /></div>
                <div class="search-of-location">Enter Your E-mail Address</div>
              </div>
            </div>
          </div>
          <div class="div-wrapper">
            <div class="input">
              <div class="img-wrapper"><img class="img" src="img/icon_2.png" /></div>
              <div class="search-of-location">Enter Your Password</div>
            </div>
          </div>
            <div class="div-wrapper">
            <div class="input">
              <div class="img-wrapper"><img class="img" src="img/icon_2.png" /></div>
              <div class="search-of-location">Confirm Password</div>
            </div>
          </div>
          <button class="button-2"><div class="primary-button">Crate an account</div></button>
          <p class="already-have-an">
            <span class="text-wrapper">Already have an account? </span> <span class="span" style="color: #17c2b1;"> Login</span>
          </p>
        </div>
        <div class="container-wrapper"><img class="container-2" src="img/Container.png" /></div>
      </div>
      <div class="top-menu">
        <div class="navbar">
          <div class="horizontal-container">
            <div class="logo">
              <img class="logo-2" src="img/Logo_1.png" /> <img class="real-estate" src="img/Real Estate_1.png" />
            </div>
          </div>
          <div class="horizontal-container-2">
            <div class="paragraph-container-2">
              <div class="text-wrapper-2">Top offers</div>
              <div class="text-wrapper-2">Search in offers</div>
              <div class="text-wrapper-2">About us</div>
              <div class="text-wrapper-2">Contact us</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
    