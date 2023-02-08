//FUNZIONAMENTO BOTTONI FENOMENI
const cancelBtn = document.querySelector("#cancellazioni");
const gaps = document.querySelectorAll(".gap");
const deletions = document.querySelectorAll(".del");
const additionsBtn = document.querySelector("#aggiunte");
const additions = document.querySelectorAll(".add");
const abbreviationsBtn = document.querySelector("#abbreviazioni");
const abbreviations = document.querySelectorAll(".abbr");
const expansions = document.querySelectorAll(".expan");
const termsBtn = document.querySelector("#termini");
const terms = document.querySelectorAll(".term");
const lingBtn = document.querySelector("#esLinguistico");
const foreignWords = document.querySelectorAll(".foreign");
const normalizeBtn = document.querySelector("#normalizzazione");
const originalWords = document.querySelectorAll(".orig");
const regularWords = document.querySelectorAll(".reg");
const insertBtn = document.querySelector("#inserimento");
const insertedWords = document.querySelectorAll(".supplied");

cancelBtn.addEventListener("click", () => {
gaps.forEach(gap => gap.classList.toggle("none"));
deletions.forEach(del => del.classList.toggle("line_through"));
});

additionsBtn.addEventListener("click", () => {
additions.forEach(add => add.classList.toggle("a"));
});

abbreviationsBtn.addEventListener("click", () => {
abbreviations.forEach(abbr => abbr.classList.toggle("none"));
expansions.forEach(exp => exp.classList.toggle("inline_block"));
});

termsBtn.addEventListener("click", () => {
terms.forEach(t => t.classList.toggle("t"));
});

lingBtn.addEventListener("click", () => {
foreignWords.forEach(f => f.classList.toggle("f"));
});

normalizeBtn.addEventListener("click", () => {
originalWords.forEach(orig => orig.classList.toggle("none"));
regularWords.forEach(reg => reg.classList.toggle("inline_block"));
});

insertBtn.addEventListener("click", () => {
insertedWords.forEach(o => o.classList.toggle("o"));
});