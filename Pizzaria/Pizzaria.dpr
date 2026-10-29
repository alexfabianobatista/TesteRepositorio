program Pizzaria;

uses
  Forms,
  UDmSistema in 'UDmSistema.pas' {DmSistema: TDataModule},
  UPadrao in 'UPadrao.pas' {FPadrao},
  UMenu in 'UMenu.pas' {FMenu},
  UFuncoes in 'UFuncoes.pas',
  UPadraoConsulta in 'UPadraoConsulta.pas' {FPadraoConsulta},
  UClienteCad in 'UClienteCad.pas' {FClienteCad},
  UOperadorCad in 'UOperadorCad.pas' {FOperadorCad},
  UTipoProdutoCad in 'UTipoProdutoCad.pas' {FTipoProdutoCad},
  UProdutoCad in 'UProdutoCad.pas' {FProdutoCad},
  UDmTipoProduto in 'UDmTipoProduto.pas' {DmTipoProduto: TDataModule},
  UDmProduto in 'UDmProduto.pas' {DmProduto: TDataModule},
  UDmCliente in 'UDmCliente.pas' {DmCliente: TDataModule},
  UDmOperador in 'UDmOperador.pas' {DmOperador: TDataModule},
  USaborCad in 'USaborCad.pas' {FSaborCad},
  UDmSabor in 'UDmSabor.pas' {DmSabor: TDataModule},
  ULogin in 'ULogin.pas' {FLogin},
  UClienteCadRapido in 'UClienteCadRapido.pas' {FClienteCadRapido},
  UParamSistemaCad in 'UParamSistemaCad.pas' {FParamSistemaCad},
  UDmParamSistema in 'UDmParamSistema.pas' {DmParamSistema: TDataModule},
  UBiblioteca in '..\MyLib\UBiblioteca.pas',
  UVenda_Nova in 'UVenda_Nova.pas' {FVenda_Nova},
  UDmVenda_Nova in 'UDmVenda_Nova.pas' {DmVenda_Nova: TDataModule},
  UVendaCons in 'UVendaCons.pas' {FVendaCons},
  UPadraoRelatorio in 'UPadraoRelatorio.pas' {FPadraoRelatorio},
  URVendaCons in 'URVendaCons.pas' {FRVendaCons},
  URVendaConsTipoProduto in 'URVendaConsTipoProduto.pas' {FRVendaConsTipoProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Pizzaria';
  Application.CreateForm(TDmSistema, DmSistema);
  Application.CreateForm(TDmTipoProduto, DmTipoProduto);
  Application.CreateForm(TDmProduto, DmProduto);
  Application.CreateForm(TDmCliente, DmCliente);
  Application.CreateForm(TDmSabor, DmSabor);
  Application.CreateForm(TDmParamSistema, DmParamSistema);
  Application.CreateForm(TDmVenda_Nova, DmVenda_Nova);
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
