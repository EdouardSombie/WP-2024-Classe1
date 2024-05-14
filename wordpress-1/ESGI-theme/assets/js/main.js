// Prise en charge du chargement asynchrone de la posts-list
window.onload = () => {
	const pageLinks = document.querySelectorAll(".page-numbers");
	pageLinks.forEach(function (elem) {
		elem.addEventListener("click", (e) => {
			e.preventDefault();
			const currentPage = Number(
				document.querySelector(".page-numbers.current").innerHTML
			);
			var target;
			if (e.target.classList.contains("next")) {
				target = currentPage + 1;
			} else if (e.target.classList.contains("prev")) {
				target = currentPage - 1;
			} else {
				target = Number(e.target.innerHTML);
			}
			console.log(target);

			// fetch vers le site
		});
	});
};
