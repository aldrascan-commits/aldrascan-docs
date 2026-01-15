import React from 'react';
import { ArrowRight, Shield, Zap, HeadphonesIcon } from 'lucide-react';
import { Button } from '../ui/button';

const HeroSection = ({ onRequestQuote }) => {
  return (
    <section className="relative overflow-hidden bg-gradient-to-b from-neutral-50 to-white dark:from-neutral-900 dark:to-neutral-950 py-20 lg:py-32">
      {/* Background decoration */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute -top-40 -right-40 w-80 h-80 bg-sky-100 dark:bg-sky-900/20 rounded-full blur-3xl opacity-50" />
        <div className="absolute -bottom-40 -left-40 w-80 h-80 bg-sky-100 dark:bg-sky-900/20 rounded-full blur-3xl opacity-50" />
      </div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-4xl mx-auto">
          {/* Badge */}
          <div className="inline-flex items-center gap-2 bg-sky-50 dark:bg-sky-950 text-sky-600 dark:text-sky-400 px-4 py-2 rounded-full text-sm font-medium mb-8">
            <span className="relative flex h-2 w-2">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-sky-500 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2 w-2 bg-sky-500"></span>
            </span>
            Catálogo Sep/Dic 2025
          </div>

          {/* Headline */}
          <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold text-neutral-900 dark:text-white tracking-tight mb-6">
            Soluciones de{' '}
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-sky-600">
              Odontología Digital
            </span>
          </h1>

          {/* Subheadline */}
          <p className="text-lg sm:text-xl text-neutral-600 dark:text-neutral-400 max-w-2xl mx-auto mb-10 leading-relaxed">
            Escáneres intraorales, fresadoras CAD/CAM y equipos de radiología de última generación. 
            Más que equipos: tranquilidad, soporte y experiencia.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
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
              className="border-neutral-300 dark:border-neutral-700 text-neutral-700 dark:text-neutral-300 hover:bg-neutral-100 dark:hover:bg-neutral-800 text-lg px-8 py-6"
              onClick={() => document.getElementById('catalogo')?.scrollIntoView({ behavior: 'smooth' })}
            >
              Ver Catálogo
            </Button>
          </div>

          {/* Features */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-6 max-w-3xl mx-auto">
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-neutral-800/50 rounded-2xl p-4 shadow-sm border border-neutral-200 dark:border-neutral-700">
              <div className="w-10 h-10 bg-emerald-50 dark:bg-emerald-950 rounded-lg flex items-center justify-center">
                <Shield className="text-emerald-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-neutral-900 dark:text-white text-sm">Garantía Extendida</p>
                <p className="text-neutral-500 dark:text-neutral-400 text-xs">Hasta 3 años</p>
              </div>
            </div>
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-neutral-800/50 rounded-2xl p-4 shadow-sm border border-neutral-200 dark:border-neutral-700">
              <div className="w-10 h-10 bg-amber-50 dark:bg-amber-950 rounded-lg flex items-center justify-center">
                <Zap className="text-amber-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-neutral-900 dark:text-white text-sm">Instalación Rápida</p>
                <p className="text-neutral-500 dark:text-neutral-400 text-xs">Presencial u online</p>
              </div>
            </div>
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-neutral-800/50 rounded-2xl p-4 shadow-sm border border-neutral-200 dark:border-neutral-700">
              <div className="w-10 h-10 bg-sky-50 dark:bg-sky-950 rounded-lg flex items-center justify-center">
                <HeadphonesIcon className="text-sky-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-neutral-900 dark:text-white text-sm">Soporte Continuo</p>
                <p className="text-neutral-500 dark:text-neutral-400 text-xs">Telefónico y online</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
