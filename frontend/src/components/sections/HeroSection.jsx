import React from 'react';
import { ArrowRight, Shield, Zap, HeadphonesIcon } from 'lucide-react';
import { Button } from '../ui/button';

const HeroSection = ({ onRequestQuote }) => {
  return (
    <section className="relative overflow-hidden bg-gradient-to-b from-slate-50 to-white dark:from-slate-900 dark:to-slate-950 py-20 lg:py-28">
      {/* Subtle background elements */}
      <div className="absolute inset-0 overflow-hidden">
        <div className="absolute -top-40 -right-40 w-96 h-96 bg-blue-100/40 dark:bg-blue-900/10 rounded-full blur-3xl" />
        <div className="absolute -bottom-40 -left-40 w-96 h-96 bg-slate-100/60 dark:bg-slate-800/20 rounded-full blur-3xl" />
        {/* Grid pattern */}
        <div className="absolute inset-0 bg-[linear-gradient(to_right,#f1f5f910_1px,transparent_1px),linear-gradient(to_bottom,#f1f5f910_1px,transparent_1px)] dark:bg-[linear-gradient(to_right,#1e293b20_1px,transparent_1px),linear-gradient(to_bottom,#1e293b20_1px,transparent_1px)] bg-[size:4rem_4rem]" />
      </div>

      <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-4xl mx-auto">
          {/* Badge - Pill style */}
          <div className="inline-flex items-center gap-2 bg-blue-50 dark:bg-blue-950/50 text-blue-600 dark:text-blue-400 px-4 py-2 rounded-full text-sm font-medium mb-8 border border-blue-100 dark:border-blue-900/50">
            <span className="relative flex h-2 w-2">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-500 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2 w-2 bg-blue-500"></span>
            </span>
            Catálogo 2025
          </div>

          {/* Headline - Clean typography */}
          <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold text-slate-900 dark:text-white tracking-tight mb-6 leading-[1.1]">
            Soluciones de{' '}
            <span className="text-blue-500">
              Odontología Digital
            </span>
          </h1>

          {/* Subheadline */}
          <p className="text-lg sm:text-xl text-slate-600 dark:text-slate-400 max-w-2xl mx-auto mb-10 leading-relaxed">
            Escáneres intraorales, fresadoras CAD/CAM y equipos de radiología de última generación. 
            Más que equipos: tranquilidad, soporte y experiencia.
          </p>

          {/* CTA Buttons */}
          <div className="flex flex-col sm:flex-row gap-4 justify-center mb-16">
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
              className="border-slate-200 dark:border-slate-700 text-slate-700 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-800 text-base font-medium px-8 py-6 rounded-xl"
              onClick={() => document.getElementById('catalogo')?.scrollIntoView({ behavior: 'smooth' })}
            >
              Ver Catálogo
            </Button>
          </div>

          {/* Features - Clean cards */}
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 max-w-3xl mx-auto">
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-slate-900 rounded-xl p-4 shadow-sm border border-slate-100 dark:border-slate-800">
              <div className="w-10 h-10 bg-emerald-50 dark:bg-emerald-950/50 rounded-lg flex items-center justify-center">
                <Shield className="text-emerald-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-slate-900 dark:text-white text-sm">Garantía Extendida</p>
                <p className="text-slate-500 dark:text-slate-400 text-xs">Hasta 3 años</p>
              </div>
            </div>
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-slate-900 rounded-xl p-4 shadow-sm border border-slate-100 dark:border-slate-800">
              <div className="w-10 h-10 bg-amber-50 dark:bg-amber-950/50 rounded-lg flex items-center justify-center">
                <Zap className="text-amber-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-slate-900 dark:text-white text-sm">Instalación Rápida</p>
                <p className="text-slate-500 dark:text-slate-400 text-xs">Presencial u online</p>
              </div>
            </div>
            <div className="flex items-center justify-center gap-3 bg-white dark:bg-slate-900 rounded-xl p-4 shadow-sm border border-slate-100 dark:border-slate-800">
              <div className="w-10 h-10 bg-blue-50 dark:bg-blue-950/50 rounded-lg flex items-center justify-center">
                <HeadphonesIcon className="text-blue-500" size={20} />
              </div>
              <div className="text-left">
                <p className="font-semibold text-slate-900 dark:text-white text-sm">Soporte Continuo</p>
                <p className="text-slate-500 dark:text-slate-400 text-xs">Telefónico y online</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
