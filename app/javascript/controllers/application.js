import { Application } from '@hotwired/stimulus';

import hamburger_controller from './hamburger_controller';
const application = Application.start();

application.register('hamburger', hamburger_controller);

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };
