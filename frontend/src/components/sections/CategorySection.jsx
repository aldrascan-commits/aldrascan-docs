import React from 'react';
import ProductCard from '../ProductCard';
import { getProductsByCategory, getCategoryById } from '../../data/catalog';
import { ScanLine, Package, Cog, RadioTower, Wrench } from 'lucide-react';

const iconMap = {
  Scan: ScanLine,
  Package: Package,
  Cog: Cog,
  Radio: RadioTower,
  Wrench: Wrench,
};

const CategorySection = ({ categoryId, onRequestQuote }) => {
  const category = getCategoryById(categoryId);
  const products = getProductsByCategory(categoryId);
  const IconComponent = iconMap[category?.icono] || ScanLine;

  if (!category || products.length === 0) return null;

  return (
    <section id={categoryId} className="py-16 lg:py-24 scroll-mt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header - Clean with line */}
        <div className="flex items-center gap-4 mb-10">
          <div className="w-11 h-11 bg-blue-50 dark:bg-blue-950/50 rounded-xl flex items-center justify-center border border-blue-100 dark:border-blue-900/50">
            <IconComponent className="text-blue-500" size={22} />
          </div>
          <div className="flex-1">
            <h2 className="text-2xl lg:text-3xl font-bold text-slate-900 dark:text-white tracking-tight">
              {category.nombre}
            </h2>
            <p className="text-slate-500 dark:text-slate-400 text-sm">
              {products.length} {products.length === 1 ? 'producto' : 'productos'} disponibles
            </p>
          </div>
          {/* Subtle line */}
          <div className="hidden md:block flex-1 h-px bg-gradient-to-r from-slate-200 dark:from-slate-700 to-transparent" />
        </div>

        {/* Products Grid - Unified layout */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {products.map((product) => (
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

export default CategorySection;
