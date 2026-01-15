import React from 'react';
import { formatPrice } from '../data/catalog';
import { Badge } from './ui/badge';
import { Button } from './ui/button';
import { Check, ChevronRight } from 'lucide-react';

const ProductCard = ({ product, onRequestQuote, variant = 'default' }) => {
  const isCompact = variant === 'compact';
  const isService = product.categoria === 'servicios';

  return (
    <div className={`group bg-white dark:bg-neutral-900 rounded-2xl border border-neutral-200 dark:border-neutral-800 overflow-hidden transition-all duration-300 hover:shadow-xl hover:shadow-neutral-200/50 dark:hover:shadow-neutral-900/50 hover:border-neutral-300 dark:hover:border-neutral-700 ${
      isCompact ? '' : 'hover:-translate-y-1'
    }`}>
      {/* Image Section */}
      {!isService && (
        <div className="relative aspect-[4/3] bg-gradient-to-br from-neutral-100 to-neutral-50 dark:from-neutral-800 dark:to-neutral-900 overflow-hidden">
          {/* Product Image */}
          {product.imagen && product.imagen.startsWith('http') ? (
            <img 
              src={product.imagen} 
              alt={product.producto}
              className="absolute inset-0 w-full h-full object-contain p-4"
              loading="lazy"
            />
          ) : (
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="w-32 h-32 bg-neutral-200 dark:bg-neutral-700 rounded-2xl flex items-center justify-center">
                <span className="text-4xl text-neutral-400 dark:text-neutral-500">
                  {product.marca?.[0] || 'A'}
                </span>
              </div>
            </div>
          )}
          
          {/* Badge */}
          {product.badge && (
            <div className="absolute top-4 left-4 z-10">
              <Badge className="bg-sky-500 text-white border-0 shadow-lg">
                {product.badge}
              </Badge>
            </div>
          )}

          {/* Brand Tag */}
          {product.marca && (
            <div className="absolute top-4 right-4 z-10">
              <span className="bg-white/90 dark:bg-neutral-900/90 backdrop-blur-sm text-neutral-600 dark:text-neutral-400 text-xs font-medium px-3 py-1 rounded-full">
                {product.marca}
              </span>
            </div>
          )}
        </div>
      )}

      {/* Content Section */}
      <div className={`p-6 ${isService ? 'pt-6' : ''}`}>
        {/* Service badge */}
        {isService && product.badge && (
          <Badge className="bg-emerald-50 dark:bg-emerald-950 text-emerald-600 dark:text-emerald-400 border-0 mb-3">
            {product.badge}
          </Badge>
        )}

        {/* Title */}
        <h3 className="text-lg font-semibold text-neutral-900 dark:text-white mb-2 group-hover:text-sky-600 dark:group-hover:text-sky-400 transition-colors">
          {product.producto}
        </h3>

        {/* Description */}
        <p className="text-neutral-600 dark:text-neutral-400 text-sm mb-4 line-clamp-2">
          {product.descripcion_corta}
        </p>

        {/* Includes (for packs) */}
        {product.esPack && product.incluye && (
          <div className="mb-4 space-y-2">
            {product.incluye.slice(0, 4).map((item, index) => (
              <div key={index} className="flex items-center gap-2 text-sm text-neutral-600 dark:text-neutral-400">
                <Check size={14} className="text-emerald-500 flex-shrink-0" />
                <span className="truncate">{item}</span>
              </div>
            ))}
          </div>
        )}

        {/* Price Section */}
        <div className="border-t border-neutral-100 dark:border-neutral-800 pt-4 mt-4">
          {/* Main Price */}
          <div className="flex items-baseline gap-2 mb-3">
            <span className="text-2xl font-bold text-neutral-900 dark:text-white">
              {formatPrice(product.pvp)}
            </span>
            {product.precioAnterior && (
              <span className="text-sm text-neutral-400 line-through">
                {formatPrice(product.precioAnterior)}
              </span>
            )}
            {product.precioMensual && (
              <span className="text-sm text-neutral-500">/mes</span>
            )}
          </div>

          {/* Price Tiers */}
          {!isService && (
            <div className="grid grid-cols-2 gap-2 mb-4">
              <div className="bg-neutral-50 dark:bg-neutral-800 rounded-lg p-2">
                <p className="text-[10px] uppercase tracking-wider text-neutral-500 dark:text-neutral-400 mb-0.5">Distribuidor</p>
                <p className="text-sm font-semibold text-neutral-700 dark:text-neutral-300">
                  {formatPrice(product.distribuidor)}
                </p>
              </div>
              {product.gold && (
                <div className="bg-amber-50 dark:bg-amber-950/30 rounded-lg p-2">
                  <p className="text-[10px] uppercase tracking-wider text-amber-600 dark:text-amber-400 mb-0.5">Gold</p>
                  <p className="text-sm font-semibold text-amber-700 dark:text-amber-300">
                    {formatPrice(product.gold)}
                  </p>
                </div>
              )}
            </div>
          )}

          {/* CTA Button */}
          <Button
            onClick={() => onRequestQuote(product)}
            className="w-full bg-neutral-900 dark:bg-white hover:bg-neutral-800 dark:hover:bg-neutral-100 text-white dark:text-neutral-900 transition-all group/btn"
          >
            <span>Solicitar Oferta</span>
            <ChevronRight size={16} className="ml-1 group-hover/btn:translate-x-1 transition-transform" />
          </Button>
        </div>

        {/* Note */}
        {product.nota && (
          <p className="text-xs text-neutral-500 dark:text-neutral-400 mt-3 text-center">
            {product.nota}
          </p>
        )}
      </div>
    </div>
  );
};

export default ProductCard;
