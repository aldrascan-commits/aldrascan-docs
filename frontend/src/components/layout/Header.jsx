import React, { useState } from 'react';
import { Menu, X, Phone, Mail } from 'lucide-react';
import { Button } from '../ui/button';
import ThemeToggle from '../ThemeToggle';

const Header = ({ onRequestQuote, activeCategory, onCategoryChange, categories }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 bg-white/95 dark:bg-slate-950/95 backdrop-blur-md border-b border-slate-100 dark:border-slate-800">
      {/* Top bar - Minimal */}
      <div className="bg-slate-900 dark:bg-slate-950 text-white py-2 px-4 text-sm">
        <div className="max-w-7xl mx-auto flex justify-between items-center">
          <div className="flex items-center gap-6">
            <a href="tel:+34662078540" className="flex items-center gap-2 hover:text-blue-400 transition-colors text-slate-300 hover:text-white">
              <Phone size={13} />
              <span className="text-sm">+34 662 078 540</span>
            </a>
            <a href="mailto:info@aldrascan.com" className="hidden sm:flex items-center gap-2 text-slate-300 hover:text-white transition-colors">
              <Mail size={13} />
              <span className="text-sm">info@aldrascan.com</span>
            </a>
          </div>
          <span className="text-slate-500 text-xs font-medium">Catálogo 2025</span>
        </div>
      </div>

      {/* Main header - Clean */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <div className="flex items-center">
            <img 
              src="https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/ikishppi_image.png" 
              alt="AldraScan Logo" 
              className="h-9 w-auto"
            />
          </div>

          {/* Desktop Navigation - Cleaner tabs */}
          <nav className="hidden lg:flex items-center gap-0.5">
            <button
              onClick={() => onCategoryChange(null)}
              className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                activeCategory === null
                  ? 'bg-blue-50 dark:bg-blue-950/50 text-blue-600 dark:text-blue-400'
                  : 'text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white hover:bg-slate-50 dark:hover:bg-slate-800/50'
              }`}
            >
              Inicio
            </button>
            {categories.map((cat) => (
              <button
                key={cat.id}
                onClick={() => onCategoryChange(cat.id)}
                className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                  activeCategory === cat.id
                    ? 'bg-blue-50 dark:bg-blue-950/50 text-blue-600 dark:text-blue-400'
                    : 'text-slate-600 dark:text-slate-400 hover:text-slate-900 dark:hover:text-white hover:bg-slate-50 dark:hover:bg-slate-800/50'
                }`}
              >
                {cat.nombre}
              </button>
            ))}
          </nav>

          {/* Actions */}
          <div className="flex items-center gap-3">
            <ThemeToggle />
            <Button
              onClick={onRequestQuote}
              className="hidden sm:flex bg-blue-500 hover:bg-blue-600 text-white font-medium rounded-xl px-5 h-10 transition-all"
            >
              Solicitar Oferta
            </Button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="lg:hidden p-2 rounded-lg hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors text-slate-600 dark:text-slate-400"
            >
              {mobileMenuOpen ? <X size={22} /> : <Menu size={22} />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Menu - Clean */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-slate-100 dark:border-slate-800 bg-white dark:bg-slate-950">
          <nav className="max-w-7xl mx-auto px-4 py-3 space-y-1">
            <button
              onClick={() => { onCategoryChange(null); setMobileMenuOpen(false); }}
              className={`w-full text-left px-4 py-2.5 rounded-lg text-sm font-medium transition-all ${
                activeCategory === null
                  ? 'bg-blue-50 dark:bg-blue-950/50 text-blue-600 dark:text-blue-400'
                  : 'text-slate-600 dark:text-slate-400'
              }`}
            >
              Inicio
            </button>
            {categories.map((cat) => (
              <button
                key={cat.id}
                onClick={() => { onCategoryChange(cat.id); setMobileMenuOpen(false); }}
                className={`w-full text-left px-4 py-2.5 rounded-lg text-sm font-medium transition-all ${
                  activeCategory === cat.id
                    ? 'bg-blue-50 dark:bg-blue-950/50 text-blue-600 dark:text-blue-400'
                    : 'text-slate-600 dark:text-slate-400'
                }`}
              >
                {cat.nombre}
              </button>
            ))}
            <div className="pt-3">
              <Button
                onClick={() => { onRequestQuote(); setMobileMenuOpen(false); }}
                className="w-full bg-blue-500 hover:bg-blue-600 text-white rounded-xl h-11"
              >
                Solicitar Oferta
              </Button>
            </div>
          </nav>
        </div>
      )}
    </header>
  );
};

export default Header;
