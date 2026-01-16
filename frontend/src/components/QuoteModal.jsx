import React, { useState } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from './ui/dialog';
import { Button } from './ui/button';
import { Input } from './ui/input';
import { Label } from './ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from './ui/select';
import { catalogData } from '../data/catalog';
import { Send, CheckCircle } from 'lucide-react';

const QuoteModal = ({ isOpen, onClose, preselectedProduct }) => {
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    producto: preselectedProduct?.id || ''
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);

    // Simulate form submission
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    setIsSubmitting(false);
    setIsSubmitted(true);

    // Reset after 3 seconds
    setTimeout(() => {
      setIsSubmitted(false);
      setFormData({ nombre: '', email: '', producto: '' });
      onClose();
    }, 3000);
  };

  // Update product when preselected changes
  React.useEffect(() => {
    if (preselectedProduct) {
      setFormData(prev => ({ ...prev, producto: preselectedProduct.id }));
    }
  }, [preselectedProduct]);

  // Filter only products that make sense to request (exclude free services)
  const availableProducts = catalogData.productos.filter(
    p => p.estado === 'activo' && (p.pvp > 0 || p.categoria !== 'servicios')
  );

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-md bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-2xl">
        <DialogHeader>
          <DialogTitle className="text-xl font-semibold text-slate-900 dark:text-white">
            Solicitar Oferta
          </DialogTitle>
          <DialogDescription className="text-slate-600 dark:text-slate-400 text-sm">
            Rellena el formulario y te contactaremos con la mejor oferta personalizada.
          </DialogDescription>
        </DialogHeader>

        {isSubmitted ? (
          <div className="py-12 text-center">
            <div className="w-14 h-14 bg-emerald-50 dark:bg-emerald-950/50 rounded-full flex items-center justify-center mx-auto mb-4">
              <CheckCircle className="text-emerald-500" size={28} />
            </div>
            <h3 className="text-lg font-semibold text-slate-900 dark:text-white mb-2">
              ¡Solicitud enviada!
            </h3>
            <p className="text-slate-600 dark:text-slate-400 text-sm">
              Te contactaremos lo antes posible.
            </p>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-5 mt-4">
            {/* Nombre */}
            <div className="space-y-2">
              <Label htmlFor="nombre" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Nombre completo
              </Label>
              <Input
                id="nombre"
                type="text"
                required
                value={formData.nombre}
                onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                placeholder="Tu nombre"
                className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-11"
              />
            </div>

            {/* Email */}
            <div className="space-y-2">
              <Label htmlFor="email" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Email
              </Label>
              <Input
                id="email"
                type="email"
                required
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                placeholder="tu@email.com"
                className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-11"
              />
            </div>

            {/* Producto */}
            <div className="space-y-2">
              <Label htmlFor="producto" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Producto de interés
              </Label>
              <Select
                value={formData.producto}
                onValueChange={(value) => setFormData({ ...formData, producto: value })}
              >
                <SelectTrigger className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 rounded-xl h-11">
                  <SelectValue placeholder="Selecciona un producto" />
                </SelectTrigger>
                <SelectContent className="bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl">
                  {availableProducts.map((product) => (
                    <SelectItem key={product.id} value={product.id}>
                      {product.producto}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            {/* Submit Button */}
            <Button
              type="submit"
              disabled={isSubmitting}
              className="w-full bg-blue-500 hover:bg-blue-600 text-white shadow-lg shadow-blue-500/20 disabled:opacity-50 transition-all rounded-xl h-11 font-medium"
            >
              {isSubmitting ? (
                <span className="flex items-center gap-2">
                  <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                  Enviando...
                </span>
              ) : (
                <span className="flex items-center gap-2">
                  <Send size={16} />
                  Enviar Solicitud
                </span>
              )}
            </Button>
          </form>
        )}
      </DialogContent>
    </Dialog>
  );
};

export default QuoteModal;
