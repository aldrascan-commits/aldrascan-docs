import React from 'react';
import ProductCard from '../ProductCard';
import { getProductsByCategory, getCategoryById } from '../../data/catalog';
import { Scan, Package, Cog, Radio, Wrench } from 'lucide-react';

const iconMap = {
  Scan: Scan,
  Package: Package,
  Cog: Cog,
  Radio: Radio,
  Wrench: Wrench,
};

const CategorySection = ({ categoryId, onRequestQuote }) => {
  const category = getCategoryById(categoryId);
  const products = getProductsByCategory(categoryId);
  const IconComponent = iconMap[category?.icono] || Scan;

  if (!category || products.length === 0) return null;

  return (
    <section id={categoryId} className="py-16 lg:py-24 scroll-mt-24">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Section Header */}
        <div className="flex items-center gap-4 mb-10">
          <div className="w-12 h-12 bg-sky-50 dark:bg-sky-950 rounded-xl flex items-center justify-center">
            <IconComponent className="text-sky-500" size={24} />
          </div>
          <div>
            <h2 className="text-2xl lg:text-3xl font-bold text-neutral-900 dark:text-white">
              {category.nombre}
            </h2>
            <p className="text-neutral-500 dark:text-neutral-400 text-sm">
              {products.length} {products.length === 1 ? 'producto' : 'productos'} disponibles
            </p>
          </div>
        </div>

        {/* Products Grid */}
        <div className={`grid gap-6 ${
          categoryId === 'servicios' 
            ? 'grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4' 
            : 'grid-cols-1 md:grid-cols-2 lg:grid-cols-3'
        }`}>
          {products.map((product) => (
            <ProductCard
              key={product.id}
              product={product}
              onRequestQuote={onRequestQuote}
              variant={categoryId === 'servicios' ? 'compact' : 'default'}
            />
          ))}
        </div>
      </div>
    </section>
  );
};

export default CategorySection;
