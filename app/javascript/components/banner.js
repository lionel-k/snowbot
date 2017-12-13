import Typed from 'typed.js';

function loadDynamicBannerText() {
  const bannerText = document.getElementById('banner-typed-text');
  if (bannerText) {
    new Typed('#banner-typed-text', {
      strings: [
        "Winter is coming ...",
        "Just for you ...",
        "SnowBot",
        "Finds the best ski resort",
        "Tracks the ski resorts weather",
        "Finds a confortable car",
        "Finds a warmful apartment",
        "Finds the right package!"],
      typeSpeed: 200,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
