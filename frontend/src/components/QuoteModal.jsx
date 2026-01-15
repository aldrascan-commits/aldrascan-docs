import React, { useState } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from '../ui/dialog';
import { Button } from '../ui/button';
import { Input } from '../ui/input';
import { Label } from '../ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../ui/select';
import { catalogData } from '../../data/catalog';
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
      <DialogContent className="sm:max-w-md bg-white dark:bg-neutral-900 border-neutral-200 dark:border-neutral-800">
        <DialogHeader>
          <DialogTitle className="text-xl font-semibold text-neutral-900 dark:text-white">
            Solicitar Oferta
          </DialogTitle>
          <DialogDescription className="text-neutral-600 dark:text-neutral-400">
            Rellena el formulario y te contactaremos con la mejor oferta personalizada.
          </DialogDescription>
        </DialogHeader>

        {isSubmitted ? (
          <div className="py-12 text-center">
            <div className="w-16 h-16 bg-emerald-50 dark:bg-emerald-950 rounded-full flex items-center justify-center mx-auto mb-4">
              <CheckCircle className="text-emerald-500" size={32} />
            </div>
            <h3 className="text-lg font-semibold text-neutral-900 dark:text-white mb-2">
              ¡Solicitud enviada!
            </h3>
            <p className="text-neutral-600 dark:text-neutral-400 text-sm">
              Te contactaremos lo antes posible.
            </p>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-5 mt-4">
            {/* Nombre */}
            <div className="space-y-2">
              <Label htmlFor="nombre" className="text-neutral-700 dark:text-neutral-300">
                Nombre completo
              </Label>
              <Input
                id="nombre"
                type="text"
                required
                value={formData.nombre}
                onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                placeholder="Tu nombre"
                className="bg-neutral-50 dark:bg-neutral-800 border-neutral-200 dark:border-neutral-700 focus:ring-sky-500"
              />
            </div>

            {/* Email */}
            <div className="space-y-2">
              <Label htmlFor="email" className="text-neutral-700 dark:text-neutral-300">
                Email
              </Label>
              <Input
                id="email"
                type="email"
                required
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                placeholder="tu@email.com"
                className="bg-neutral-50 dark:bg-neutral-800 border-neutral-200 dark:border-neutral-700 focus:ring-sky-500"
              />
            </div>

            {/* Producto */}
            <div className="space-y-2">
              <Label htmlFor="producto" className="text-neutral-700 dark:text-neutral-300">
                Producto de interés
              </Label>
              <Select
                value={formData.producto}
                onValueChange={(value) => setFormData({ ...formData, producto: value })}
              >
                <SelectTrigger className="bg-neutral-50 dark:bg-neutral-800 border-neutral-200 dark:border-neutral-700">
                  <SelectValue placeholder="Selecciona un producto" />
                </SelectTrigger>
                <SelectContent className="bg-white dark:bg-neutral-900 border-neutral-200 dark:border-neutral-800">
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
              className="w-full bg-sky-500 hover:bg-sky-600 text-white shadow-lg shadow-sky-500/25 disabled:opacity-50 transition-all"
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
