import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
	static targets = [
		'body',
		'nav',
		'menu',
		'background',
		'navbarHeading',
		'menuIcon',
		'searchIcon',
	];

	toggleMenu() {
		this.menuTarget.classList.toggle('hidden');
		this.menuIconTarget.classList.toggle('hidden');
		this.navbarHeadingTarget.classList.toggle('hidden');
		this.searchIconTarget.classList.add('hidden');
		this.navTarget.classList.add('w-[50vw]');
		this.navTarget.classList.remove('w-full');
		document
			.getElementsByTagName('body')[0]
			.classList.toggle('overflow-hidden');
	}

	closeMenu() {
		this.menuTarget.classList.add('hidden');
		this.menuIconTarget.classList.remove('hidden');
		this.navbarHeadingTarget.classList.remove('hidden');
		this.searchIconTarget.classList.remove('hidden');
		this.navTarget.classList.remove('w-[50vw]');
		this.navTarget.classList.add('w-full');
		document
			.getElementsByTagName('body')[0]
			.classList.toggle('overflow-hidden');
	}
}
