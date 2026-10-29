unit UCustoEntrega_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, variants;

type
  TFCustoEntregaCad = class(TFTCadSimples)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SBFilialCad: TSpeedButton;
    SBVendedorCad: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    Opes1: TMenuItem;
    BaixaEntrega1: TMenuItem;
    SBNotaCad: TSpeedButton;
    RelaodeEntregas1: TMenuItem;
    VoltaBaixa1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBFilialCadClick(Sender: TObject);
    procedure SBVendedorCadClick(Sender: TObject);
    procedure BaixaEntrega1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBNotaCadClick(Sender: TObject);
    procedure RelaodeEntregas1Click(Sender: TObject);
    procedure VoltaBaixa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoEntregaCad: TFCustoEntregaCad;

implementation

uses UCustoEntrega_cl, UFilial_cl, UVendedor_cl, UFilialCons, UVendedorCons,
  UBaixaEntrega, UCustoEntregaCons, UNotaSaidaCons, UNotaSaida_cl,
  UCustoEntregaParam, URCustoEntrega;

{$R *.DFM}

procedure TFCustoEntregaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMCustoEntrega.QCustoEntrega.Close;
  Action := CaFree;
  FCustoEntregaCad := Nil;
end;

procedure TFCustoEntregaCad.FormActivate(Sender: TObject);
begin
  inherited;
   DMCustoEntrega.QCustoEntrega.open;
end;

procedure TFCustoEntregaCad.SBFilialCadClick(Sender: TObject);
begin
  inherited; 
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    With DMCustoEntrega do
      QCustoEntregaCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFCustoEntregaCad.SBVendedorCadClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal=mrOk then
    With DMCustoEntrega do
      QCustoEntregaCod_Vendedor.Value:=DMVendedor.QVendedorConsCod_Vendedor.Value;  
end;

procedure TFCustoEntregaCad.BaixaEntrega1Click(Sender: TObject);
begin
  inherited;
  If FBaixaEntrega = Nil then
    FBaixaEntrega:= TFBaixaEntrega.Create(Application);
    FBaixaEntrega.ShowModal;
end;

procedure TFCustoEntregaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBFilialCad.Enabled:=DSPrimario.State<>dsBrowse;
  SBVendedorCad.Enabled:=DSPrimario.State<>dsBrowse;
  SBNotaCad.Enabled:=DSPrimario.State<>dsBrowse;
end;

procedure TFCustoEntregaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCustoEntregaCons = Nil then
    FCustoEntregaCons := TFCustoEntregaCons.Create(Application);
  If FCustoEntregaCons.ShowModal = mrOk then
  With DMCustoEntrega do
  Begin
    QCustoEntrega.Close;
    QCustoEntrega.SetVariable('PK',QCustoEntregaConsCod_Custo_Entrega.Value);
    QCustoEntrega.Open;
  end;
end;
procedure TFCustoEntregaCad.SBNotaCadClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons:=TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = mrOk then
    With DMCustoEntrega do
      QCustoEntregaCod_Nota_Cab.Value:=DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFCustoEntregaCad.RelaodeEntregas1Click(Sender: TObject);
begin
  inherited;
  if FCustoEntregaParam = nil then
    FCustoEntregaParam:= TFCustoEntregaParam.Create(Application);
    FCustoEntregaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FCustoEntregaParam.ShowModal = mrOk then
  begin
    With DMCustoEntrega do
    begin
      QRCustoEntrega.Close;
      if(trim(FCustoEntregaParam.ME0DtInicial.text)<>'') AND (trim(FCustoEntregaParam.ME0DtFinal.text)<>'')then
      Begin
        QRCustoEntrega.setVariable('DT_INICIAL',trim(FCustoEntregaParam.ME0DtInicial.text));
        QRCustoEntrega.setVariable('DT_FINAL',trim(FCustoEntregaParam.ME0DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

       If(Trim(FCustoEntregaParam.ME0Filial.Text) <> '')Then
        QRCustoEntrega.setVariable('FILIAL',trim(FCustoEntregaParam.ME0Filial.text))
      Else
        QRCustoEntrega.setVariable('FILIAL',null);

       If(Trim(FCustoEntregaParam.ME0Vendedor.Text) <> '')Then
        QRCustoEntrega.setVariable('VENDEDOR',trim(FCustoEntregaParam.ME0Vendedor.text))
      Else
        QRCustoEntrega.setVariable('VENDEDOR',null);

       If(Trim(FCustoEntregaParam.ME0CodNota.Text) <> '')Then
        QRCustoEntrega.setVariable('NOTA',trim(FCustoEntregaParam.ME0CodNota.text))
      Else
        QRCustoEntrega.setVariable('NOTA',null);

      QRCustoEntrega.Open;
      If FRCustoEntrega = Nil Then
         FRCustoEntrega := TFRCustoEntrega.Create(Application);
         FRCustoEntrega.QRLFilial.Caption := 'Filial: ' + FCustoEntregaParam.ME0Filial.text + ' '+ FCustoEntregaParam.Ed0Filial.Text;
         FRCustoEntrega.QRLPeriodo.Caption := 'Período: ' + FCustoEntregaParam.ME0DtInicial.text + ' até ' + FCustoEntregaParam.ME0DtFinal.text;
      if FCustoEntregaParam.RGPreview.ItemIndex = 0 then
        FRCustoEntrega.QRPrimario.Preview
      else
        FRCustoEntrega.QRPrimario.Print;
      QRCustoEntrega.Close;
    end;
  end;

end;

procedure TFCustoEntregaCad.VoltaBaixa1Click(Sender: TObject);
begin
  inherited;
  if (DMCustoEntrega.QCustoEntregaCOD_CUSTO_ENTREGA.Value <> 0) then
    begin
      If ((DMCustoEntrega.QCustoEntregaIND_SITUACAO.Value = 'ENTREGUE') or (DMCustoEntrega.QCustoEntregaIND_SITUACAO.Value = 'TRANSITO')) Then
        begin
          DMCustoEntrega.QCustoEntrega.Edit;
          DMCustoEntrega.QCustoEntregaInd_Situacao.Value := 'PENDENTE';
          DMCustoEntrega.QCustoEntregaDT_BAIXA.Clear;
          DMCustoEntrega.QCustoEntrega.Post;
        end;
    end
    else
      ShowMessage('Erro! Nenhuma entrega está selecionada.');
end;
end.
