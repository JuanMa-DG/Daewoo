const express = require("express");
const router = express.Router();
//La constante POOL hace referencia a la conexión con la base de datos
const pool = require ("../database");
const { isLoggedIn } = require("../lib/auth");

router.get("/add", isLoggedIn, (req, res) => {
	res.render("links/add");
});

router.post("/add", isLoggedIn, async (req, res) => {
	const { titulo, precio, detalle_principal } = req.body;
	const newLink = {
		titulo,
		precio,
		detalle_principal,
		id_usuario: req.user.id		
	};	
	await pool.query("INSERT INTO prueba_prod set ?", [newLink]);
	req.flash("success", "Producto creado correctamente");
	res.redirect("/links");
});

router.get("/", isLoggedIn, async (req, res) => {
	const links = await pool.query("SELECT * FROM prueba_prod WHERE id_usuario = ?", [req.user.id]);
	res.render("links/list", { links });
});

router.get ("/delete/:id", isLoggedIn, async (req, res) => {
	const { id } = req.params;
	await pool.query("DELETE FROM prueba_prod WHERE id = ?", [id]); 
	req.flash("success", "Producto eliminado correctamente");
	res.redirect("/links");
});

router.get("/edit/:id", isLoggedIn, async (req, res) => {
	const { id } = req.params;
	const links = await pool.query("SELECT * FROM prueba_prod WHERE id = ?", [id]);
	res.render("links/edit", {link: links[0]});
});

router.post("/edit/:id", isLoggedIn, async (req, res) => {
	const { id } = req.params;
	const { titulo, precio, detalle_principal } = req.body;
	const newLink = {
		titulo,
		precio,
		detalle_principal
	};
	await pool.query("UPDATE prueba_prod set ? WHERE id = ?", [newLink, id]);
	req.flash("success", "Producto actualizado correctamente");
	res.redirect("/links");
});

module.exports = router;