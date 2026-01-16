import React from 'react';
import { formatPrice } from '../data/catalog';
import { Button } from './ui/button';
import { Check, ChevronRight, Lock } from 'lucide-react';

const ProductCard = ({ product, onRequestQuote, variant = 'default' }) => {
  const isService = product.categoria === 'servicios';

  return (
    <div 
      className="group bg-white dark:bg-slate-900 rounded-2xl border border-slate-100 dark:border-slate-800 overflow-hidden transition-all duration-300 hover:shadow-xl hover:shadow-slate-200/50 dark:hover:shadow-black/20 hover:border-slate-200 dark:hover:border-slate-700 hover:-translate-y-1 flex flex-col h-full"
      data-testid={`product-card-${product.id}`}
    >
      {/* ============================================
          IMAGE CONTAINER - Fixed 4:3 ratio for all
          ============================================ */}
      <div 
        className="relative w-full bg-gradient-to-br from-slate-50 to-slate-100 dark:from-slate-800 dark:to-slate-900 overflow-hidden"
        style={{ aspectRatio: '4 / 3' }}
      >
        {/* Image wrapper - centered flex container */}
        <div className="absolute inset-0 flex items-center justify-center p-5">
          {product.imagen && (product.imagen.startsWith('http') || product.imagen.startsWith('/')) ? (
            <img 
              src={product.imagen} 
              alt={product.producto}
              className="w-full h-full object-contain object-center"
              loading="lazy"
              draggable="false"
            />
          ) : (
            <div className="w-20 h-20 bg-slate-200/50 dark:bg-slate-700/50 rounded-2xl flex items-center justify-center">
              <span className="text-3xl font-light text-slate-400 dark:text-slate-500">
                {isService ? '⚡' : (product.marca?.[0] || 'A')}
              </span>
            </div>
          )}
        </div>
        
        {/* Badge - Top left pill */}
        {product.badge && (
          <div className="absolute top-3 left-3 z-10">
            <span className="inline-flex items-center px-2.5 py-1 rounded-full text-[11px] font-semibold bg-blue-500 text-white shadow-md">
              {product.badge}
            </span>
          </div>
        )}

        {/* Brand Tag - Top right */}
        {product.marca && !isService && (
          <div className="absolute top-3 right-3 z-10">
            <span className="bg-white/90 dark:bg-slate-900/90 backdrop-blur-sm text-slate-600 dark:text-slate-400 text-[10px] font-medium px-2 py-0.5 rounded-full border border-slate-200/50 dark:border-slate-700/50">
              {product.marca}
            </span>
          </div>
        )}
      </div>

      {/* ============================================
          CONTENT SECTION - Unified padding & spacing
          ============================================ */}
      <div className="flex flex-col flex-grow p-5">
        
        {/* Product Title - Fixed height zone */}
        <h3 className="text-base font-semibold text-slate-900 dark:text-white mb-2 group-hover:text-blue-600 dark:group-hover:text-blue-400 transition-colors leading-tight line-clamp-2 min-h-[2.5rem]">
          {product.producto}
        </h3>

        {/* Description - Fixed 2 lines */}
        <p className="text-slate-500 dark:text-slate-400 text-sm leading-relaxed line-clamp-2 min-h-[2.5rem] mb-3">
          {product.descripcion_corta}
        </p>

        {/* Includes list (for packs) - Compact */}
        {product.esPack && product.incluye && (
          <div className="mb-3 space-y-1">
            {product.incluye.slice(0, 3).map((item, index) => (
              <div key={index} className="flex items-center gap-1.5 text-xs text-slate-600 dark:text-slate-400">
                <Check size={12} className="text-blue-500 flex-shrink-0" />
                <span className="truncate">{item}</span>
              </div>
            ))}
            {product.incluye.length > 3 && (
              <span className="text-[10px] text-slate-400 dark:text-slate-500 ml-4">
                +{product.incluye.length - 3} más
              </span>
            )}
          </div>
        )}

        {/* Spacer to push price section to bottom */}
        <div className="flex-grow" />

        {/* ============================================
            PRICE SECTION - Always at bottom, unified
            ============================================ */}
        <div className="border-t border-slate-100 dark:border-slate-800 pt-4 mt-auto">
          
          {/* Main PVP Price */}
          <div className="flex items-baseline gap-2 mb-3">
            <span className="text-xl font-bold text-slate-900 dark:text-white tracking-tight">
              {formatPrice(product.pvp)}
            </span>
            {product.precioAnterior && (
              <span className="text-xs text-slate-400 line-through">
                {formatPrice(product.precioAnterior)}
              </span>
            )}
            {product.precioMensual && (
              <span className="text-xs text-slate-500">/mes</span>
            )}
          </div>

          {/* Price Tiers - Hidden, request access */}
          {!isService && (
            <button
              onClick={() => onRequestQuote(product, true)}
              className="w-full mb-4 py-2 px-3 bg-slate-50 dark:bg-slate-800/50 rounded-lg border border-slate-100 dark:border-slate-700/50 hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors group/prices"
            >
              <div className="flex items-center justify-center gap-2 text-xs text-slate-500 dark:text-slate-400 group-hover/prices:text-blue-500 dark:group-hover/prices:text-blue-400">
                <Lock size={12} />
                <span>Ver precios Distribuidor y Gold</span>
              </div>
            </button>
          )}

          {/* Services - Single price display */}
          {isService && (
            <div className="mb-4">
              <div className="bg-emerald-50/50 dark:bg-emerald-950/20 rounded-lg p-2 border border-emerald-100 dark:border-emerald-900/30 text-center">
                <p className="text-[9px] uppercase tracking-wider text-emerald-600 dark:text-emerald-500 font-medium">Servicio incluido o precio fijo</p>
              </div>
            </div>
          )}

          {/* CTA Button - Always same position */}
          <Button
            onClick={() => onRequestQuote(product)}
            className="w-full bg-blue-500 hover:bg-blue-600 text-white font-medium rounded-xl transition-all duration-200 group/btn h-10 text-sm"
            data-testid={`request-quote-${product.id}`}
          >
            <span>Solicitar Oferta</span>
            <ChevronRight size={14} className="ml-1 group-hover/btn:translate-x-0.5 transition-transform" />
          </Button>
        </div>

        {/* Note - If exists */}
        {product.nota && (
          <p className="text-[10px] text-slate-400 dark:text-slate-500 mt-2 text-center leading-tight">
            {product.nota}
          </p>
        )}
      </div>
    </div>
  );
};

export default ProductCard;
