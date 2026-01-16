import React from 'react';
import { formatPrice } from '../data/catalog';
import { Badge } from './ui/badge';
import { Button } from './ui/button';
import { Check, ChevronRight } from 'lucide-react';

const ProductCard = ({ product, onRequestQuote, variant = 'default' }) => {
  const isCompact = variant === 'compact';
  const isService = product.categoria === 'servicios';

  return (
    <div className={`group bg-white dark:bg-slate-900 rounded-2xl border border-slate-100 dark:border-slate-800 overflow-hidden transition-all duration-300 hover:shadow-lg hover:shadow-slate-200/60 dark:hover:shadow-slate-900/60 hover:border-slate-200 dark:hover:border-slate-700 ${
      isCompact ? '' : 'hover:-translate-y-1'
    }`}>
      {/* Image Section */}
      {!isService && (
        <div className="relative aspect-[4/3] bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-800 dark:to-slate-900 overflow-hidden">
          {/* Product Image Container - Fixed ratio with centered contain */}
          <div className="absolute inset-0 flex items-center justify-center p-6">
            {product.imagen && product.imagen.startsWith('http') ? (
              <img 
                src={product.imagen} 
                alt={product.producto}
                className="max-w-full max-h-full w-auto h-auto object-contain object-center"
                loading="lazy"
                style={{ aspectRatio: 'auto' }}
              />
            ) : (
              <div className="w-24 h-24 bg-slate-100 dark:bg-slate-800 rounded-2xl flex items-center justify-center">
                <span className="text-3xl font-light text-slate-300 dark:text-slate-600">
                  {product.marca?.[0] || 'A'}
                </span>
              </div>
            )}
          </div>
          
          {/* Badge - Pill style */}
          {product.badge && (
            <div className="absolute top-4 left-4 z-10">
              <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-blue-500 text-white shadow-sm">
                {product.badge}
              </span>
            </div>
          )}

          {/* Brand Tag - Subtle */}
          {product.marca && (
            <div className="absolute top-4 right-4 z-10">
              <span className="bg-white/95 dark:bg-slate-900/95 backdrop-blur-sm text-slate-500 dark:text-slate-400 text-[11px] font-medium px-2.5 py-1 rounded-full border border-slate-100 dark:border-slate-700">
                {product.marca}
              </span>
            </div>
          )}

          {/* Subtle bottom gradient */}
          <div className="absolute bottom-0 left-0 right-0 h-16 bg-gradient-to-t from-white/80 to-transparent dark:from-slate-900/80 pointer-events-none" />
        </div>
      )}

      {/* Content Section */}
      <div className={`p-5 ${isService ? 'pt-5' : ''}`}>
        {/* Service badge */}
        {isService && product.badge && (
          <span className="inline-flex items-center px-2.5 py-1 rounded-full text-[11px] font-medium bg-emerald-50 dark:bg-emerald-950/50 text-emerald-600 dark:text-emerald-400 mb-3">
            {product.badge}
          </span>
        )}

        {/* Title */}
        <h3 className="text-base font-semibold text-slate-900 dark:text-white mb-1.5 group-hover:text-blue-600 dark:group-hover:text-blue-400 transition-colors leading-tight">
          {product.producto}
        </h3>

        {/* Description */}
        <p className="text-slate-500 dark:text-slate-400 text-sm mb-4 line-clamp-2 leading-relaxed">
          {product.descripcion_corta}
        </p>

        {/* Includes (for packs) - Cleaner list */}
        {product.esPack && product.incluye && (
          <div className="mb-4 space-y-1.5">
            {product.incluye.slice(0, 4).map((item, index) => (
              <div key={index} className="flex items-center gap-2 text-sm text-slate-600 dark:text-slate-400">
                <Check size={14} className="text-blue-500 flex-shrink-0" />
                <span className="truncate">{item}</span>
              </div>
            ))}
          </div>
        )}

        {/* Price Section - Clean separation */}
        <div className="border-t border-slate-100 dark:border-slate-800 pt-4 mt-4">
          {/* Main Price */}
          <div className="flex items-baseline gap-2 mb-3">
            <span className="text-2xl font-bold text-slate-900 dark:text-white tracking-tight">
              {formatPrice(product.pvp)}
            </span>
            {product.precioAnterior && (
              <span className="text-sm text-slate-400 line-through">
                {formatPrice(product.precioAnterior)}
              </span>
            )}
            {product.precioMensual && (
              <span className="text-sm text-slate-500">/mes</span>
            )}
          </div>

          {/* Price Tiers - Subtle cards */}
          {!isService && (
            <div className="grid grid-cols-2 gap-2 mb-4">
              <div className="bg-slate-50 dark:bg-slate-800/50 rounded-lg p-2.5 border border-slate-100 dark:border-slate-700/50">
                <p className="text-[10px] uppercase tracking-wider text-slate-400 dark:text-slate-500 mb-0.5 font-medium">Distribuidor</p>
                <p className="text-sm font-semibold text-slate-700 dark:text-slate-300">
                  {formatPrice(product.distribuidor)}
                </p>
              </div>
              {product.gold && (
                <div className="bg-amber-50/50 dark:bg-amber-950/20 rounded-lg p-2.5 border border-amber-100 dark:border-amber-900/30">
                  <p className="text-[10px] uppercase tracking-wider text-amber-600 dark:text-amber-500 mb-0.5 font-medium">Gold</p>
                  <p className="text-sm font-semibold text-amber-700 dark:text-amber-400">
                    {formatPrice(product.gold)}
                  </p>
                </div>
              )}
            </div>
          )}

          {/* CTA Button - Clean style */}
          <Button
            onClick={() => onRequestQuote(product)}
            className="w-full bg-blue-500 hover:bg-blue-600 text-white font-medium rounded-xl transition-all group/btn h-11"
          >
            <span>Solicitar Oferta</span>
            <ChevronRight size={16} className="ml-1 group-hover/btn:translate-x-0.5 transition-transform" />
          </Button>
        </div>

        {/* Note - Subtle */}
        {product.nota && (
          <p className="text-xs text-slate-400 dark:text-slate-500 mt-3 text-center">
            {product.nota}
          </p>
        )}
      </div>
    </div>
  );
};

export default ProductCard;
