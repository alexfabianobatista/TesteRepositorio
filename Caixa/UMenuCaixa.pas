unit UMenuCaixa;
  
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuCaixa = class(TFTMenuPrincipal)
    SistemadeCaixa1: TMenuItem;
    Caixa1: TMenuItem;
    Detalhamento1: TMenuItem;
    Saldo1: TMenuItem;
    Historico1: TMenuItem;
    Contabiliza1: TMenuItem;
    ReciboExtra1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    CentrodeCusto1: TMenuItem;
    CadastroMovimento1: TMenuItem;
    CadastroSaldo1: TMenuItem;
    NotaPromissriaExstra1: TMenuItem;
    TransfernciaEntreFiliais1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure Detalhamento1Click(Sender: TObject);
    procedure Saldo1Click(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure Contabiliza1Click(Sender: TObject);
    procedure ReciboExtra1Click(Sender: TObject);
    procedure CentrodeCusto1Click(Sender: TObject);
    procedure CadastroMovimento1Click(Sender: TObject);
    procedure CadastroSaldo1Click(Sender: TObject);
    procedure NotaPromissriaExstra1Click(Sender: TObject);
    procedure TransfernciaEntreFiliais1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCaixa: TFMenuCaixa;

implementation

uses UCaixa_Cad, UTela_cl, UCaixaDetCad, UCaixaSaldo, UHistoricoCad,
  UContabilizaCaixa, UReciboParam, UFluxoCaixaCad, UCentroCustoCad,
  UFluxoCaixaSaldoCad, UNotaPromissoriaParam, UCaixaTransferencia;

{$R *.DFM}

procedure TFMenuCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  Self.pModulo:='CAIXA';
end;

procedure TFMenuCaixa.Caixa1Click(Sender: TObject);
begin
  inherited;
  If FCaixaCad = Nil then
    FCaixaCad := TFCaixaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCaixaCad.Caption,FCaixaCad.Name);
  FCaixaCad.ShowModal;
end;

procedure TFMenuCaixa.Detalhamento1Click(Sender: TObject);
begin
  inherited;
  If FCaixaDetCad=Nil then
    FCaixaDetCad:=TFCaixaDetCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCaixaDetCad.Caption,FCaixaDetCad.Name);
  FCaixaDetCad.ShowModal;
end;

procedure TFMenuCaixa.Saldo1Click(Sender: TObject);
begin
  inherited;
  If FCaixaSaldo=Nil then
    FCaixaSaldo:=TFCaixaSaldo.Create(Application);
  DMTela.VerificaTela(pModulo,FCaixaSaldo.Caption,FCaixaSaldo.Name);
  FCaixaSaldo.ShowModal;
end;

procedure TFMenuCaixa.Historico1Click(Sender: TObject);
begin
  inherited;
  If FHistoricoCad=Nil then
    FHistoricoCad:=TFHistoricoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FHistoricoCad.Caption,FHistoricoCad.Name);
  FHistoricoCad.ShowModal;
end;

procedure TFMenuCaixa.Contabiliza1Click(Sender: TObject);
begin
  inherited;
  If FContabilizaCaixa=Nil then
    FContabilizaCaixa:=TFContabilizaCaixa.Create(Application);
  DMTela.VerificaTela(pModulo,FContabilizaCaixa.Caption,FContabilizaCaixa.Name);
  FContabilizaCaixa.ShowModal;
End;

procedure TFMenuCaixa.ReciboExtra1Click(Sender: TObject);
begin
  inherited;
  If FReciboParam = Nil then
    FReciboParam:=TFReciboParam.Create(Application);
  DMTela.VerificaTela(pModulo,FReciboParam.Caption,FReciboParam.Name);
  FReciboParam.ShowModal;
end;

procedure TFMenuCaixa.CentrodeCusto1Click(Sender: TObject);
begin
  inherited;
  If FCentroCustoCad = Nil then
     FCentroCustoCad := TFCentroCustoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FCentroCustoCad.Caption,FCentroCustoCad.Name);
  FCentroCustoCad.Showmodal;      
end;

procedure TFMenuCaixa.CadastroMovimento1Click(Sender: TObject);
begin
  inherited;
  If FFluxoCaixaCad = Nil then
    FFluxoCaixaCad := TFFluxoCaixaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFluxoCaixaCad.Caption,FFluxoCaixaCad.Name);
  FFluxoCaixaCad.Showmodal;

end;

procedure TFMenuCaixa.CadastroSaldo1Click(Sender: TObject);
begin
  inherited;
  If fFluxoCaixaSaldoCad = Nil then
    FFluxoCaixaSaldoCad := TFFluxoCaixaSaldoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFluxoCaixaSaldoCad.Caption,FFluxoCaixaSaldoCad.Name);
  FFluxoCaixaSaldoCad.Showmodal;

end;

procedure TFMenuCaixa.NotaPromissriaExstra1Click(Sender: TObject);
begin
  inherited;
  If FNotaPromissoriaParam = Nil then
    FNotaPromissoriaParam := TFNotaPromissoriaParam.Create(Application);
  DMTela.VerificaTela(pModulo,FNotaPromissoriaParam.Caption,FNotaPromissoriaParam.Name);
  FNotaPromissoriaParam.ShowModal;
end;

procedure TFMenuCaixa.TransfernciaEntreFiliais1Click(Sender: TObject);
begin
  inherited;
  If FCaixaTransferencia = Nil then
    FCaixaTransferencia := TFCaixaTransferencia.Create(Application);
  DMTela.VerificaTela(pModulo,FCaixaTransferencia.Caption,FCaixaTransferencia.Name);
  FCaixaTransferencia.ShowModal;

end;

end.
