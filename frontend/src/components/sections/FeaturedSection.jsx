import React from 'react';
import ProductCard from '../ProductCard';
import { getFeaturedProducts } from '../../data/catalog';
import { Sparkles } from 'lucide-react';

const FeaturedSection = ({ onRequestQuote }) => {
  const featured = getFeaturedProducts();

  if (featured.length === 0) return null;

  return (
    <section id="catalogo" className="py-16 lg:py-24 bg-slate-50/50 dark:bg-slate-900/30">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header - Clean */}
        <div className="text-center mb-12">
          <div className="inline-flex items-center gap-2 bg-amber-50 dark:bg-amber-950/30 text-amber-600 dark:text-amber-400 px-4 py-2 rounded-full text-sm font-medium mb-4 border border-amber-100 dark:border-amber-900/30">
            <Sparkles size={14} />
            Productos Destacados
          </div>
          <h2 className="text-3xl lg:text-4xl font-bold text-slate-900 dark:text-white mb-4 tracking-tight">
            Lo más popular
          </h2>
          <p className="text-slate-600 dark:text-slate-400 max-w-2xl mx-auto leading-relaxed">
            Nuestros productos más vendidos y recomendados para clínicas dentales que buscan lo mejor en odontología digital.
          </p>
        </div>

        {/* Featured Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {featured.slice(0, 6).map((product) => (
            <ProductCard
              key={product.id}
              product={product}
              onRequestQuote={onRequestQuote}
            />
          ))}
        </div>
      </div>
    </section>
  );
};

export default FeaturedSection;
