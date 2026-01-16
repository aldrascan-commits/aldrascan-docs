import React, { useState } from 'react';
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogDescription } from './ui/dialog';
import { Button } from './ui/button';
import { Input } from './ui/input';
import { Label } from './ui/label';
import { Textarea } from './ui/textarea';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from './ui/select';
import { catalogData } from '../data/catalog';
import { Send, CheckCircle, Lock, Building2 } from 'lucide-react';

const QuoteModal = ({ isOpen, onClose, preselectedProduct, requestType = 'quote' }) => {
  const isPriceRequest = requestType === 'prices';
  
  const [formData, setFormData] = useState({
    nombre: '',
    email: '',
    telefono: '',
    empresa: '',
    producto: preselectedProduct?.id || '',
    mensaje: ''
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
      setFormData({ nombre: '', email: '', telefono: '', empresa: '', producto: '', mensaje: '' });
      onClose();
    }, 3000);
  };

  // Update product when preselected changes
  React.useEffect(() => {
    if (preselectedProduct) {
      setFormData(prev => ({ ...prev, producto: preselectedProduct.id }));
    }
  }, [preselectedProduct]);

  // Filter only products that make sense to request
  const availableProducts = catalogData.productos.filter(
    p => p.estado === 'activo' && (p.pvp > 0 || p.categoria !== 'servicios')
  );

  const modalTitle = isPriceRequest ? 'Solicitar Precios Especiales' : 'Solicitar Oferta';
  const modalDescription = isPriceRequest 
    ? 'Accede a los precios Distribuidor y Gold. Completa el formulario y verificaremos tu solicitud.'
    : 'Rellena el formulario y te contactaremos con la mejor oferta personalizada.';
  const successMessage = isPriceRequest
    ? 'Verificaremos tu solicitud y te enviaremos los precios especiales.'
    : 'Te contactaremos lo antes posible.';

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="sm:max-w-md bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-2xl">
        <DialogHeader>
          <DialogTitle className="text-xl font-semibold text-slate-900 dark:text-white flex items-center gap-2">
            {isPriceRequest && <Lock size={20} className="text-amber-500" />}
            {modalTitle}
          </DialogTitle>
          <DialogDescription className="text-slate-600 dark:text-slate-400 text-sm">
            {modalDescription}
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
              {successMessage}
            </p>
          </div>
        ) : (
          <form onSubmit={handleSubmit} className="space-y-4 mt-4">
            {/* Nombre */}
            <div className="space-y-1.5">
              <Label htmlFor="nombre" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Nombre completo *
              </Label>
              <Input
                id="nombre"
                type="text"
                required
                value={formData.nombre}
                onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                placeholder="Tu nombre"
                className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-10"
              />
            </div>

            {/* Email */}
            <div className="space-y-1.5">
              <Label htmlFor="email" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Email profesional *
              </Label>
              <Input
                id="email"
                type="email"
                required
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                placeholder="tu@clinica.com"
                className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-10"
              />
            </div>

            {/* Teléfono y Empresa - Solo para solicitud de precios */}
            {isPriceRequest && (
              <>
                <div className="grid grid-cols-2 gap-3">
                  <div className="space-y-1.5">
                    <Label htmlFor="telefono" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                      Teléfono *
                    </Label>
                    <Input
                      id="telefono"
                      type="tel"
                      required
                      value={formData.telefono}
                      onChange={(e) => setFormData({ ...formData, telefono: e.target.value })}
                      placeholder="+34 600 000 000"
                      className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-10"
                    />
                  </div>
                  <div className="space-y-1.5">
                    <Label htmlFor="empresa" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                      Empresa/Clínica *
                    </Label>
                    <Input
                      id="empresa"
                      type="text"
                      required
                      value={formData.empresa}
                      onChange={(e) => setFormData({ ...formData, empresa: e.target.value })}
                      placeholder="Nombre de tu clínica"
                      className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl h-10"
                    />
                  </div>
                </div>
              </>
            )}

            {/* Producto */}
            <div className="space-y-1.5">
              <Label htmlFor="producto" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                Producto de interés
              </Label>
              <Select
                value={formData.producto}
                onValueChange={(value) => setFormData({ ...formData, producto: value })}
              >
                <SelectTrigger className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 rounded-xl h-10">
                  <SelectValue placeholder="Selecciona un producto" />
                </SelectTrigger>
                <SelectContent className="bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 rounded-xl max-h-60">
                  {availableProducts.map((product) => (
                    <SelectItem key={product.id} value={product.id}>
                      {product.producto}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            {/* Mensaje adicional - Solo para solicitud de precios */}
            {isPriceRequest && (
              <div className="space-y-1.5">
                <Label htmlFor="mensaje" className="text-slate-700 dark:text-slate-300 text-sm font-medium">
                  Mensaje (opcional)
                </Label>
                <Textarea
                  id="mensaje"
                  value={formData.mensaje}
                  onChange={(e) => setFormData({ ...formData, mensaje: e.target.value })}
                  placeholder="Cuéntanos sobre tu clínica o necesidades específicas..."
                  className="bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 focus:ring-blue-500 rounded-xl resize-none"
                  rows={3}
                />
              </div>
            )}

            {/* Info box for price request */}
            {isPriceRequest && (
              <div className="bg-amber-50 dark:bg-amber-950/30 border border-amber-100 dark:border-amber-900/30 rounded-xl p-3">
                <div className="flex items-start gap-2">
                  <Building2 size={16} className="text-amber-600 dark:text-amber-500 mt-0.5 flex-shrink-0" />
                  <p className="text-xs text-amber-700 dark:text-amber-400">
                    Los precios Distribuidor y Gold están reservados para profesionales y distribuidores verificados. Tu solicitud será revisada en 24-48h.
                  </p>
                </div>
              </div>
            )}

            {/* Submit Button */}
            <Button
              type="submit"
              disabled={isSubmitting}
              className={`w-full text-white shadow-lg disabled:opacity-50 transition-all rounded-xl h-11 font-medium ${
                isPriceRequest 
                  ? 'bg-amber-500 hover:bg-amber-600 shadow-amber-500/20' 
                  : 'bg-blue-500 hover:bg-blue-600 shadow-blue-500/20'
              }`}
            >
              {isSubmitting ? (
                <span className="flex items-center gap-2">
                  <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                  Enviando...
                </span>
              ) : (
                <span className="flex items-center gap-2">
                  {isPriceRequest ? <Lock size={16} /> : <Send size={16} />}
                  {isPriceRequest ? 'Solicitar Acceso' : 'Enviar Solicitud'}
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
