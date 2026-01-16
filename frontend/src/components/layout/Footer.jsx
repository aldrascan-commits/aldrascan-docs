import React from 'react';
import { Phone, Mail, MapPin } from 'lucide-react';

const Footer = () => {
  return (
    <footer className="bg-white dark:bg-slate-950 border-t border-slate-100 dark:border-slate-800">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">
          {/* Brand */}
          <div className="lg:col-span-2">
            <div className="flex items-center mb-6">
              <img 
                src="https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/ikishppi_image.png" 
                alt="AldraScan Logo" 
                className="h-10 w-auto"
              />
            </div>
            <p className="text-slate-600 dark:text-slate-400 max-w-md leading-relaxed text-sm">
              Más que un escáner. Ofrecemos tranquilidad, soporte técnico continuo y experiencia especializada 
              para que tu clínica dental dé el salto a la odontología digital con total confianza.
            </p>
          </div>

          {/* Contact */}
          <div>
            <h4 className="text-sm font-semibold text-slate-900 dark:text-white mb-5 uppercase tracking-wider">Contacto</h4>
            <div className="space-y-4">
              <a href="tel:+34662078540" className="flex items-center gap-3 text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">
                <Phone size={16} />
                <span>+34 662 078 540</span>
              </a>
              <a href="mailto:info@aldrascan.com" className="flex items-center gap-3 text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">
                <Mail size={16} />
                <span>info@aldrascan.com</span>
              </a>
              <div className="flex items-start gap-3 text-slate-600 dark:text-slate-400 text-sm">
                <MapPin size={16} className="mt-0.5 flex-shrink-0" />
                <span>Alicante, Valencia, Murcia, Madrid</span>
              </div>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="text-sm font-semibold text-slate-900 dark:text-white mb-5 uppercase tracking-wider">Productos</h4>
            <ul className="space-y-3">
              <li>
                <a href="#escaneres" className="text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">Escáneres Intraorales</a>
              </li>
              <li>
                <a href="#packs" className="text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">Packs</a>
              </li>
              <li>
                <a href="#cadcam" className="text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">CAD/CAM</a>
              </li>
              <li>
                <a href="#radiologia" className="text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">Radiología</a>
              </li>
              <li>
                <a href="#servicios" className="text-slate-600 dark:text-slate-400 hover:text-blue-500 dark:hover:text-blue-400 transition-colors text-sm">Servicios</a>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom - Clean separator */}
        <div className="mt-12 pt-8 border-t border-slate-100 dark:border-slate-800">
          <div className="flex flex-col sm:flex-row justify-between items-center gap-4">
            <p className="text-slate-500 dark:text-slate-500 text-sm">
              © 2025 AldraScan. Todos los derechos reservados.
            </p>
            <p className="text-slate-400 dark:text-slate-600 text-xs">
              Los precios NO incluyen IVA 21% ni gastos de transporte.
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
