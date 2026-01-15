import React, { useState } from 'react';
import { Menu, X, Phone, Mail } from 'lucide-react';
import { Button } from '../ui/button';
import ThemeToggle from '../ThemeToggle';

const Header = ({ onRequestQuote, activeCategory, onCategoryChange, categories }) => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 bg-white/80 dark:bg-neutral-950/80 backdrop-blur-xl border-b border-neutral-200 dark:border-neutral-800">
      {/* Top bar */}
      <div className="bg-neutral-900 dark:bg-neutral-950 text-white py-2 px-4 text-sm">
        <div className="max-w-7xl mx-auto flex justify-between items-center">
          <div className="flex items-center gap-6">
            <a href="tel:+34662078540" className="flex items-center gap-2 hover:text-sky-400 transition-colors">
              <Phone size={14} />
              <span>+34 662 078 540</span>
            </a>
            <a href="mailto:info@aldrascan.com" className="hidden sm:flex items-center gap-2 hover:text-sky-400 transition-colors">
              <Mail size={14} />
              <span>info@aldrascan.com</span>
            </a>
          </div>
          <span className="text-neutral-400 text-xs">Catálogo Sep/Dic 2025</span>
        </div>
      </div>

      {/* Main header */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <div className="flex items-center">
            <img 
              src="https://customer-assets.emergentagent.com/job_dental-showcase-3/artifacts/ikishppi_image.png" 
              alt="AldraScan Logo" 
              className="h-10 w-auto"
            />
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden lg:flex items-center gap-1">
            <button
              onClick={() => onCategoryChange(null)}
              className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                activeCategory === null
                  ? 'bg-sky-50 dark:bg-sky-950 text-sky-600 dark:text-sky-400'
                  : 'text-neutral-600 dark:text-neutral-400 hover:text-neutral-900 dark:hover:text-white hover:bg-neutral-100 dark:hover:bg-neutral-800'
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
                    ? 'bg-sky-50 dark:bg-sky-950 text-sky-600 dark:text-sky-400'
                    : 'text-neutral-600 dark:text-neutral-400 hover:text-neutral-900 dark:hover:text-white hover:bg-neutral-100 dark:hover:bg-neutral-800'
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
              className="hidden sm:flex bg-sky-500 hover:bg-sky-600 text-white shadow-lg shadow-sky-500/25 hover:shadow-sky-500/40 transition-all"
            >
              Solicitar Oferta
            </Button>
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="lg:hidden p-2 rounded-lg hover:bg-neutral-100 dark:hover:bg-neutral-800 transition-colors"
            >
              {mobileMenuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-neutral-200 dark:border-neutral-800 bg-white dark:bg-neutral-950">
          <nav className="max-w-7xl mx-auto px-4 py-4 space-y-1">
            <button
              onClick={() => { onCategoryChange(null); setMobileMenuOpen(false); }}
              className={`w-full text-left px-4 py-3 rounded-lg text-sm font-medium transition-all ${
                activeCategory === null
                  ? 'bg-sky-50 dark:bg-sky-950 text-sky-600 dark:text-sky-400'
                  : 'text-neutral-600 dark:text-neutral-400'
              }`}
            >
              Inicio
            </button>
            {categories.map((cat) => (
              <button
                key={cat.id}
                onClick={() => { onCategoryChange(cat.id); setMobileMenuOpen(false); }}
                className={`w-full text-left px-4 py-3 rounded-lg text-sm font-medium transition-all ${
                  activeCategory === cat.id
                    ? 'bg-sky-50 dark:bg-sky-950 text-sky-600 dark:text-sky-400'
                    : 'text-neutral-600 dark:text-neutral-400'
                }`}
              >
                {cat.nombre}
              </button>
            ))}
            <div className="pt-4">
              <Button
                onClick={() => { onRequestQuote(); setMobileMenuOpen(false); }}
                className="w-full bg-sky-500 hover:bg-sky-600 text-white"
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
