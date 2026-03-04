import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './context/AuthContext';

import Header from './components/Header';
import LoginPage from './pages/Login';
import HomePage from './pages/Home';
import ShopPage from './pages/Shop';
import ServicePage from './pages/Service';
import StoreManagePage from './pages/StoreManage';
import JobRegisterPage from './pages/JobRegister';
import VideosPage from './pages/Videos';
import AgronomiPage from './pages/AgronomiPage';
import AIChatPage from './pages/AIChat';

function ProtectedRoute({ children }) {
  const { user, loading } = useAuth();
  if (loading) return <div className="spinner" style={{ marginTop: 80 }}></div>;
  if (!user) return <Navigate to="/login" replace />;
  return children;
}

function AppLayout({ children }) {
  return (
    <>
      <Header />
      {children}
    </>
  );
}

function AppRoutes() {
  const { user } = useAuth();

  return (
    <Routes>
      <Route path="/login" element={user ? <Navigate to="/" replace /> : <LoginPage />} />
      <Route path="/" element={
        <ProtectedRoute>
          <AppLayout><HomePage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/shop/:type" element={
        <ProtectedRoute>
          <AppLayout><ShopPage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/service/:type" element={
        <ProtectedRoute>
          <AppLayout><ServicePage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/agronom" element={
        <ProtectedRoute>
          <AppLayout><AgronomiPage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/dokon-yurutish" element={
        <ProtectedRoute>
          <AppLayout><StoreManagePage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/ishga-joylashish" element={
        <ProtectedRoute>
          <AppLayout><JobRegisterPage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/videolar" element={
        <ProtectedRoute>
          <AppLayout><VideosPage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="/ai-maslahatchi" element={
        <ProtectedRoute>
          <AppLayout><AIChatPage /></AppLayout>
        </ProtectedRoute>
      } />
      <Route path="*" element={<Navigate to="/" replace />} />
    </Routes>
  );
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <AppRoutes />
      </BrowserRouter>
    </AuthProvider>
  );
}
