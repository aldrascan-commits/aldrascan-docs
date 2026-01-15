import React from 'react';
import { Button } from '../ui/button';
import { ArrowRight, Phone } from 'lucide-react';

const CTASection = ({ onRequestQuote }) => {
  return (
    <section className="py-20 lg:py-28 bg-neutral-900 dark:bg-neutral-950 relative overflow-hidden">
      {/* Background decoration */}
      <div className="absolute inset-0">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-sky-500/10 rounded-full blur-3xl" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-sky-500/10 rounded-full blur-3xl" />
      </div>

      <div className="relative max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 className="text-3xl sm:text-4xl lg:text-5xl font-bold text-white mb-6">
          ¿Listo para dar el salto a la{' '}
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-sky-400 to-sky-500">
            odontología digital
          </span>?
        </h2>
        <p className="text-lg text-neutral-400 mb-10 max-w-2xl mx-auto">
          Contáctanos y te asesoraremos sin compromiso. Descubre la mejor solución para tu clínica con un presupuesto personalizado.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Button
            onClick={onRequestQuote}
            size="lg"
            className="bg-sky-500 hover:bg-sky-600 text-white shadow-xl shadow-sky-500/25 hover:shadow-sky-500/40 transition-all text-lg px-8 py-6"
          >
            Solicitar Oferta
            <ArrowRight className="ml-2" size={20} />
          </Button>
          <Button
            variant="outline"
            size="lg"
            className="border-neutral-700 text-white hover:bg-neutral-800 text-lg px-8 py-6"
            asChild
          >
            <a href="tel:+34662078540">
              <Phone className="mr-2" size={20} />
              +34 662 078 540
            </a>
          </Button>
        </div>
      </div>
    </section>
  );
};

export default CTASection;
