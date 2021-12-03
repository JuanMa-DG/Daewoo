const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const pool = require("../database");
const helpers = require("../lib/helpers");

passport.use("local.signin", new LocalStrategy({
	usernameField: "nombre",
	passwordField: "password",
	passReqToCallback: true
}, async (req, nombre, password, done) => {	
	const rows = await pool.query("SELECT * FROM usuarios WHERE nombre = ?", [nombre]);
	if (rows.length > 0) {
		const user = rows[0];
		const validPassword = await helpers.matchPassword(password, user.password);
		if (validPassword) {
			done(null, user, req.flash("success"));
		} else {
			done(null, false, req.flash("message", "La contraseña es incorrecta"));
		}
	} else {
		return done(null, false, req.flash("message", "El nombre de usuario no existe"));
	}
}));

passport.use("local.signup", new LocalStrategy({
	usernameField: "nombre",
	passwordField: "password",
	passReqToCallback: true
}, async (req, nombre, password, done) => {
	const { email } = req.body;
	const newUser = {
		nombre,
		password,
		email
	};
	newUser.password = await helpers.encryptPassword(password);
	const result = await pool.query("INSERT INTO usuarios SET ?", [newUser]);
	newUser.id = result.insertId;
	return done(null, newUser);
}));

passport.serializeUser((user, done) => {
	done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
	const rows = await pool.query("SELECT * FROM usuarios WHERE id = ?", [id]);
	done(null, rows[0]);
});