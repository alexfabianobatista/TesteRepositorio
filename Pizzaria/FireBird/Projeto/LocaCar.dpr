program LocaCar;

uses
  Forms,
  UDmSistema in 'UDmSistema.pas' {DmSistema: TDataModule},
  UPadrao in 'UPadrao.pas' {FPadrao},
  UClienteCad in 'UClienteCad.pas' {FClienteCad},
  UMenu in 'UMenu.pas' {FMenu},
  UDmEndereco in 'UDmEndereco.pas' {DmEndereco: TDataModule},
  UDmBairro in 'UDmBairro.pas' {DmBairro: TDataModule},
  UDmCliente in 'UDmCliente.pas' {DmCliente: TDataModule},
  UCidadeCad in 'UCidadeCad.pas' {FCidadeCad},
  UEnderecoCad in 'UEnderecoCad.pas' {FEnderecoCad},
  UFuncoes in 'UFuncoes.pas',
  UBairroCad in 'UBairroCad.pas' {FBairroCad},
  UDmCidade in 'UDmCidade.pas' {DmCidade: TDataModule},
  UDmEstado in 'UDmEstado.pas' {DmEstado: TDataModule},
  UEstadoCad in 'UEstadoCad.pas' {FEstadoCad},
  UCorCad in 'UCorCad.pas' {FCorCad},
  UMarcaCad in 'UMarcaCad.pas' {FMarcaCad},
  UDmMarca in 'UDmMarca.pas' {DmMarca: TDataModule},
  UDmCor in 'UDmCor.pas' {DmCor: TDataModule},
  UDmVendedor in 'UDmVendedor.pas' {DmVendedor: TDataModule},
  UVendedorCad in 'UVendedorCad.pas' {FVendedorCad},
  UVeiculoCad in 'UVeiculoCad.pas' {FVeiculoCad},
  UPadraoConsulta in 'UPadraoConsulta.pas' {FPadraoConsulta},
  UClienteCons in 'UClienteCons.pas' {FClienteCons},
  UDmVeiculo in 'UDmVeiculo.pas' {DmVeiculo: TDataModule},
  UVeiculoCons in 'UVeiculoCons.pas' {FVeiculoCons},
  UVendedorCons in 'UVendedorCons.pas' {FVendedorCons},
  UVenda in 'UVenda.pas' {FVenda},
  UDmVenda in 'UDmVenda.pas' {DmVenda: TDataModule},
  UCompra in 'UCompra.pas' {FCompra},
  UDmCompra in 'UDmCompra.pas' {DmCompra: TDataModule},
  UClienteCons_MaisComprou in 'UClienteCons_MaisComprou.pas' {FClienteCons_MaisComprou},
  UClienteCons_VendaMes in 'UClienteCons_VendaMes.pas' {FClienteCons_VendaMes},
  UClienteCons_CompraVenda in 'UClienteCons_CompraVenda.pas' {FClienteCons_CompraVenda},
  UClienteCons_CompraVendaMesmoMes in 'UClienteCons_CompraVendaMesmoMes.pas' {FClienteCons_CompraVendaMesmoMes},
  UClienteCons_VeiculosVendidos in 'UClienteCons_VeiculosVendidos.pas' {FClienteCons_VeiculosVendidos},
  UVendedorCons_Comissao in 'UVendedorCons_Comissao.pas' {FVendedorCons_Comissao},
  UVendaCons in 'UVendaCons.pas' {FVendaCons};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'LocaCar';
  Application.CreateForm(TDmSistema, DmSistema);
  Application.CreateForm(TDmEndereco, DmEndereco);
  Application.CreateForm(TDmBairro, DmBairro);
  Application.CreateForm(TDmCliente, DmCliente);
  Application.CreateForm(TDmCidade, DmCidade);
  Application.CreateForm(TDmEstado, DmEstado);
  Application.CreateForm(TDmMarca, DmMarca);
  Application.CreateForm(TDmCor, DmCor);
  Application.CreateForm(TDmVendedor, DmVendedor);
  Application.CreateForm(TDmVeiculo, DmVeiculo);
  Application.CreateForm(TDmVenda, DmVenda);
  Application.CreateForm(TDmCompra, DmCompra);
  Application.CreateForm(TFMenu, FMenu);
  Application.Run;
end.
