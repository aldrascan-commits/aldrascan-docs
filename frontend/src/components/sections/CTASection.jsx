import React from 'react';
import { Button } from '../ui/button';
import { ArrowRight, Phone } from 'lucide-react';

const CTASection = ({ onRequestQuote }) => {
  return (
    <section className="py-20 lg:py-28 bg-slate-900 dark:bg-slate-950 relative overflow-hidden">
      {/* Subtle background */}
      <div className="absolute inset-0">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-blue-500/5 rounded-full blur-3xl" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-blue-500/5 rounded-full blur-3xl" />
        {/* Grid pattern */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#1e293b30_1px,transparent_1px),linear-gradient(to_bottom,#1e293b30_1px,transparent_1px)] bg-[size:4rem_4rem]" />
      </div>

      <div className="relative max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 className="text-3xl sm:text-4xl lg:text-5xl font-bold text-white mb-6 tracking-tight leading-tight">
          ¿Listo para dar el salto a la{' '}
          <span className="text-blue-400">
            odontología digital
          </span>?
        </h2>
        <p className="text-lg text-slate-400 mb-10 max-w-2xl mx-auto leading-relaxed">
          Contáctanos y te asesoraremos sin compromiso. Descubre la mejor solución para tu clínica con un presupuesto personalizado.
        </p>
        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Button
            onClick={onRequestQuote}
            size="lg"
            className="bg-blue-500 hover:bg-blue-600 text-white shadow-lg shadow-blue-500/20 hover:shadow-blue-500/30 transition-all text-base font-medium px-8 py-6 rounded-xl"
          >
            Solicitar Oferta
            <ArrowRight className="ml-2" size={18} />
          </Button>
          <Button
            variant="outline"
            size="lg"
            className="border-slate-700 text-white hover:bg-slate-800 text-base font-medium px-8 py-6 rounded-xl"
            asChild
          >
            <a href="tel:+34662078540">
              <Phone className="mr-2" size={18} />
              +34 662 078 540
            </a>
          </Button>
        </div>
      </div>
    </section>
  );
};

export default CTASection;
