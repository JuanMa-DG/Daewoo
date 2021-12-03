const express = require('express');
const morgan = require("morgan");
const exphbs = require("express-handlebars");
const path = require("path");
const flash = require("connect-flash");
const session = require("express-session");
const MySQLStore = require("express-mysql-session");
const { database } = require("./keys");
const passport = require("passport");
// Inicializaciones
// 
const app = express();
require("./lib/passport");

// Configs
// 
app.set("port", process.env.PORT || 5000);
app.set("views", path.join(__dirname, "views"));
app.engine(".hbs", exphbs.engine({
	defaultLayout: "main",
	layoutsDir:  path.join(app.get("views"), "layouts"),
	partialsDir: path.join(app.get("views"), "partials"),
	extname: ".hbs",
	helpers: require("./lib/handlebars")
}));
app.set("view engine", ".hbs");

// Middlewares
// 
app.use(session({
	secret: "daewoomysqlnodesession",
	resave: false,
	saveUninitialized: false,
	store: new MySQLStore(database)
}));
app.use(flash());
app.use(morgan("dev"));
app.use(express.urlencoded({extended: false})); // En FALSE no puedo recibir imágenes, solo datos sencillos
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());


// Variables Globales
// 
app.use((req, res, next) => {
	app.locals.success = req.flash("success");
	app.locals.message = req.flash("message");
	app.locals.user = req.user;
	next();
});


// Rutas
// 
app.use(require("./routes"));
app.use(require("./routes/authentication"));
app.use("/links", require("./routes/links"));

// Public
// 
app.use(express.static(path.join(__dirname, "public")));


// Iniciar Servidor
// 
app.listen(app.get("port"), () => {

	console.log("Servidor Iniciado en el puerto", app.get("port"));

});


app.use(express.json());
app.use(morgan('dev'));

app.use(express.static("public"));


