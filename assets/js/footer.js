// Footer transversal — se carga automáticamente en <div id="footer-root">
(function () {
  var root = document.getElementById('footer-root');
  if (!root) return;

  fetch('assets/components/footer.html')
    .then(function (r) { return r.text(); })
    .then(function (html) { root.innerHTML = html; });
})();
