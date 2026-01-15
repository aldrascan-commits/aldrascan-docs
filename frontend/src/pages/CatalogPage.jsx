import React, { useState, useEffect } from 'react';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import HeroSection from '../components/sections/HeroSection';
import FeaturedSection from '../components/sections/FeaturedSection';
import CategorySection from '../components/sections/CategorySection';
import CTASection from '../components/sections/CTASection';
import QuoteModal from '../components/QuoteModal';
import { catalogData } from '../data/catalog';

const CatalogPage = () => {
  const [quoteModalOpen, setQuoteModalOpen] = useState(false);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [activeCategory, setActiveCategory] = useState(null);

  const handleRequestQuote = (product = null) => {
    setSelectedProduct(product);
    setQuoteModalOpen(true);
  };

  const handleCategoryChange = (categoryId) => {
    setActiveCategory(categoryId);
    if (categoryId) {
      setTimeout(() => {
        document.getElementById(categoryId)?.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }, 100);
    } else {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  };

  // Initialize theme from localStorage
  useEffect(() => {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'dark') {
      document.documentElement.classList.add('dark');
    } else if (savedTheme === 'light') {
      document.documentElement.classList.remove('dark');
    } else if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
      document.documentElement.classList.add('dark');
    }
  }, []);

  return (
    <div className="min-h-screen bg-white dark:bg-neutral-950">
      <Header
        onRequestQuote={() => handleRequestQuote()}
        activeCategory={activeCategory}
        onCategoryChange={handleCategoryChange}
        categories={catalogData.categorias}
      />

      <main>
        {/* Hero Section */}
        <HeroSection onRequestQuote={() => handleRequestQuote()} />

        {/* Featured Products */}
        <FeaturedSection onRequestQuote={handleRequestQuote} />

        {/* Category Sections */}
        {catalogData.categorias.map((category) => (
          <div
            key={category.id}
            className={category.id === 'packs' || category.id === 'radiologia' ? 'bg-neutral-50 dark:bg-neutral-900/50' : ''}
          >
            <CategorySection
              categoryId={category.id}
              onRequestQuote={handleRequestQuote}
            />
          </div>
        ))}

        {/* CTA Section */}
        <CTASection onRequestQuote={() => handleRequestQuote()} />
      </main>

      <Footer />

      {/* Quote Modal */}
      <QuoteModal
        isOpen={quoteModalOpen}
        onClose={() => setQuoteModalOpen(false)}
        preselectedProduct={selectedProduct}
      />
    </div>
  );
};

export default CatalogPage;
