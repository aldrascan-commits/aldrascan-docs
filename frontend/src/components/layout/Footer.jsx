import React from 'react';
import { Phone, Mail, MapPin } from 'lucide-react';

const Footer = () => {
  return (
    <footer className="bg-neutral-900 dark:bg-neutral-950 text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">
          {/* Brand */}
          <div className="lg:col-span-2">
            <div className="flex items-center gap-3 mb-6">
              <div className="w-12 h-12 bg-gradient-to-br from-sky-500 to-sky-600 rounded-xl flex items-center justify-center">
                <span className="text-white font-bold text-xl">A</span>
              </div>
              <div>
                <h3 className="text-2xl font-semibold">AldraScan</h3>
                <p className="text-neutral-400 text-sm">Soluciones de Odontología Digital</p>
              </div>
            </div>
            <p className="text-neutral-400 max-w-md leading-relaxed">
              Más que un escáner. Ofrecemos tranquilidad, soporte técnico continuo y experiencia especializada 
              para que tu clínica dental dé el salto a la odontología digital con total confianza.
            </p>
          </div>

          {/* Contact */}
          <div>
            <h4 className="text-lg font-semibold mb-6">Contacto</h4>
            <div className="space-y-4">
              <a href="tel:+34662078540" className="flex items-center gap-3 text-neutral-400 hover:text-sky-400 transition-colors">
                <Phone size={18} />
                <span>+34 662 078 540</span>
              </a>
              <a href="mailto:info@aldrascan.com" className="flex items-center gap-3 text-neutral-400 hover:text-sky-400 transition-colors">
                <Mail size={18} />
                <span>info@aldrascan.com</span>
              </a>
              <div className="flex items-start gap-3 text-neutral-400">
                <MapPin size={18} className="mt-1 flex-shrink-0" />
                <span>Alicante, Valencia, Murcia, Madrid</span>
              </div>
            </div>
          </div>

          {/* Quick Links */}
          <div>
            <h4 className="text-lg font-semibold mb-6">Productos</h4>
            <ul className="space-y-3">
              <li>
                <a href="#escaneres" className="text-neutral-400 hover:text-sky-400 transition-colors">Escáneres Intraorales</a>
              </li>
              <li>
                <a href="#packs" className="text-neutral-400 hover:text-sky-400 transition-colors">Packs</a>
              </li>
              <li>
                <a href="#cadcam" className="text-neutral-400 hover:text-sky-400 transition-colors">CAD/CAM</a>
              </li>
              <li>
                <a href="#radiologia" className="text-neutral-400 hover:text-sky-400 transition-colors">Radiología</a>
              </li>
              <li>
                <a href="#servicios" className="text-neutral-400 hover:text-sky-400 transition-colors">Servicios</a>
              </li>
            </ul>
          </div>
        </div>

        {/* Bottom */}
        <div className="mt-16 pt-8 border-t border-neutral-800">
          <div className="flex flex-col sm:flex-row justify-between items-center gap-4">
            <p className="text-neutral-500 text-sm">
              © 2025 AldraScan. Todos los derechos reservados.
            </p>
            <p className="text-neutral-500 text-xs">
              Los precios NO incluyen IVA 21% ni gastos de transporte.
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
