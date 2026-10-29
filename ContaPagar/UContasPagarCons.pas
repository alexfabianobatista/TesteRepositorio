unit UContasPagarCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, Db, Menus;

type
  TFContasPagarCons = class(TFTConsulta)
    MECodFinalidade: TMaskEdit;
    MECodAgencia: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    MECodFilial: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    MEDataVencInicial: TMaskEdit;
    Label6: TLabel;
    MEDataVencFinal: TMaskEdit;
    MEFinalidade: TMaskEdit;
    MEFilial: TMaskEdit;
    MEAgencia: TMaskEdit;
    RGSituacao: TRadioGroup;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    MEDataEmissaoInicial: TMaskEdit;
    MEDataEmissaoFinal: TMaskEdit;
    Label9: TLabel;
    MECodDepto: TMaskEdit;
    MEDepartamento: TMaskEdit;
    SpeedButton4: TSpeedButton;
    Label11: TLabel;
    Label18: TLabel;
    MECodCliente: TMaskEdit;
    SpeedButton9: TSpeedButton;
    MeNrTitulo: TMaskEdit;
    Label12: TLabel;
    MeCadastro: TMaskEdit;
    Label7: TLabel;
    Label10: TLabel;
    LblValor: TLabel;
    Label21: TLabel;
    MeValor: TMaskEdit;
    Label13: TLabel;
    MeTipoDocumento: TMaskEdit;
    RgOrdem: TRadioGroup;
    SbProcuraNota: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure MECodAgenciaChange(Sender: TObject);
    procedure MECodFinalidadeChange(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECodDeptoChange(Sender: TObject);
    procedure MECodClienteChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure MeValorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SbProcuraNotaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContasPagarCons: TFContasPagarCons;

implementation

uses UContasPagar_cl, UFinalidadeCons, UFinalidade_cl, UBancosCons,
  UBancoAgencia_cl, UFilialCons, UFilial_cl, UOracle_cl, UDepartamentoCons,
  UDepartamento_cl, UCadastroCons, UCadastro_cl, UUsuario_cl,
  UParamSistema_cl, UNotaSaida_cl, UNotaItensCons;

{$R *.DFM}

procedure TFContasPagarCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons=Nil then
    FFinalidadeCons:=TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal=mrOk then
    Begin
      MECodFinalidade.Text:=FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);
      MEFinalidade.Text:=DMFinalidade.QFinalidadeConsDesc_Finalidade.Value;
    End;
end;

procedure TFContasPagarCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FBancosCons=Nil then
    FBancosCons:=TFBancosCons.Create(Application);
  If FBancosCons.ShowModal=mrOk then
    Begin
      MECodAgencia.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
      MEAgencia.Text:=DMBancoAgencia.QBancoAgenciaConsDesc_Banco_Agencia.Value;
    End;
end;

procedure TFContasPagarCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If FFilialCons.ShowModal=mrOk then
    Begin
      MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    End;
end;

procedure TFContasPagarCons.FormActivate(Sender: TObject);
begin
  inherited;
  MECodAgencia.Clear;
  MEAgencia.Clear;
  MEFinalidade.Clear;
  MECodFinalidade.Clear;
  MECodFilial.Clear;
  MEFilial.Clear;
//  MEDataVencInicial.Text := DateToStr(DATE() - 15);
//  MEDataVencFinal.Text := DateToStr(DATE() + 5);
end;

procedure TFContasPagarCons.BtProcurarClick(Sender: TObject);
var
wValor_Total : Real;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(MECodFilial.Text),'CONTAS A PAGAR');
  With DMContasPagar do
    Begin
      QContasPagar_CabCons.Close;
      QContasPagar_CabCons.Sql.Clear;
      QContasPagar_CabCons.Sql.Add('SELECT TB_CADASTRO.NOME ,TB_CADASTRO.DESC_FANTASIA,TB_CADASTRO.NUM_CGC_CPF,TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB ,');
      QContasPagar_CabCons.Sql.Add('TB_CONTA_PAGAR_CAB.COD_FINALIDADE ,TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA ,TB_CONTA_PAGAR_CAB.COD_CADASTRO ,TB_CONTA_PAGAR_CAB.COD_FILIAL,');
      QContasPagar_CabCons.Sql.Add('TB_CONTA_PAGAR_CAB.NUM_TITULO ,TB_CONTA_PAGAR_CAB.NUM_PARCELA ,TB_CONTA_PAGAR_CAB.DESC_TIPO_DOCUMENTO,');
      QContasPagar_CabCons.Sql.Add('TB_CONTA_PAGAR_CAB.DT_EMISSAO,TB_CONTA_PAGAR_CAB.VAL_TITULO,TB_CONTA_PAGAR_CAB.VAL_ORIGINAL,TB_CONTA_PAGAR_CAB.DT_BAIXA,');
      QContasPagar_CabCons.Sql.Add('TB_CONTA_PAGAR_CAB.IND_SITUACAO,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO,TB_CONTA_PAGAR_CAB.IND_ACEITE,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO,');
      QContasPagar_CabCons.Sql.Add('TB_FINALIDADE.DESC_FINALIDADE,TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA, TB_FILIAL.DESC_FILIAL, TB_CONTA_PAGAR_CAB.COD_NOTA_CAB,  ');
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RAZENTE' Then
        QContasPagar_CabCons.SQL.Add('TB_OBRA.DESC_OBRA')
      else
      Begin
        QContasPagar_CabCons.SQL.Add('TB_CONTA_PAGAR_CAB.DESC_OBSERVACAO AS DESC_OBRA');
        DBGrid1.Columns.Items[13].Title.Caption := 'Observação';
      end;
      QContasPagar_CabCons.Sql.Add(' FROM TB_CONTA_PAGAR_CAB,TB_CADASTRO, TB_FINALIDADE, TB_BANCO_AGENCIA, TB_FILIAL, TB_OBRA WHERE ');
      QContasPagar_CabCons.Sql.Add(' TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
      QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE ');
      QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA(+)');
      QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
      QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
      If Trim(METexto.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CADASTRO.NUM_CGC_CPF = ' + chr(39) + Trim(METexto.Text) + chr(39));
      If Trim(MECodFinalidade.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = ' + Trim(MECodFinalidade.Text));
      If Trim(MECodDepto.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO = ' + Trim(MECodDepto.Text));
      If Trim(MECodAgencia.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA = ' + Trim(MECodAgencia.Text));
      If Trim(MECodFilial.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = ' + Trim(MECodFilial.Text));
      If Trim(MEDataEmissaoInicial.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO >= ' + 'To_Date('''+Trim(MEDataEmissaoInicial.Text)+''',''dd/mm/yyyy'')');
      If Trim(MEDataEmissaoFinal.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO <= ' + 'To_Date('''+Trim(MEDataEmissaoFinal.Text)+''',''dd/mm/yyyy'')');
      Case RGSituacao.ItemIndex of
        0:QContasPagar_CabCons.Sql.Add(' AND (TB_CONTA_PAGAR_CAB.IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + CHR(39) +
                                          ' and TB_CONTA_PAGAR_CAB.IND_SITUACAO <> ' + chr(39) + 'REPARCELAR' + CHR(39) + ') ');
        1:QContasPagar_CabCons.Sql.Add(' AND (TB_CONTA_PAGAR_CAB.IND_SITUACAO = ' + chr(39) + 'BAIXA TOTAL' + CHR(39) +
                                          ' or TB_CONTA_PAGAR_CAB.IND_SITUACAO = ' + chr(39) + 'REPARCELAR' + CHR(39) + ') ');
      End;
      If Trim(MECodCliente.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_CADASTRO = ' + Trim(MECodCliente.Text));
      If Trim(MENrTitulo.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.NUM_TITULO = ' + Trim(MENrTitulo.Text));
      If Trim(MeTipoDocumento.Text) <> '' then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DESC_TIPO_DOCUMENTO = ' + Chr(39) + Trim(MeTipoDocumento.Text) + Chr(39));
      If Trim(MEDataVencInicial.Text) <> '' Then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO >= ' + 'To_Date('''+Trim(MEDataVencInicial.Text)+''',''dd/mm/yyyy'')');
      If Trim(MEDataVencFinal.Text) <> '' Then
         QContasPagar_CabCons.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO <= ' + 'To_Date('''+Trim(MEDataVencFinal.Text)+''',''dd/mm/yyyy'')');
      if Trim(MeValor.text) <> '' Then
         QContasPagar_CabCons.Sql.Add(' AND (VAL_TITULO = ' + Trim(MeValor.text) + 'OR VAL_ORIGINAL = ' + Trim(MeValor.text) + ')');

      Case RgOrdem.ItemIndex of
        0 : QContasPagar_CabCons.Sql.Add(' Order By TB_CONTA_PAGAR_CAB.DT_VENCIMENTO');
        1 : QContasPagar_CabCons.Sql.Add(' Order By TB_CONTA_PAGAR_CAB.NUM_TITULO');
        2 : QContasPagar_CabCons.Sql.Add(' Order By TB_CADASTRO.NOME');
      End;
      QContasPagar_CabCons.Open;
      wValor_Total := 0;
      QContasPagar_CabCons.First;
      while Not QContasPagar_CabCons.Eof Do
      begin
        wValor_Total := wValor_Total + QContasPagar_CabConsVal_Titulo.Value;
        QContasPagar_CabCons.next;
      end;
      LblValor.Caption := FormatFloat('#,##0.00',wValor_Total);
    end;


end;

procedure TFContasPagarCons.MECodAgenciaChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodAgencia.Text)<>'' Then
    MEAgencia.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodAgencia.Text)
  Else
    MEAgencia.Text:='';
end;

procedure TFContasPagarCons.MECodFinalidadeChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodFinalidade.Text)<>'' Then
    MEFinalidade.Text:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+MECodFinalidade.Text)
  Else
    MEFinalidade.Text:='';
end;

procedure TFContasPagarCons.MECodFilialChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodFilial.Text)<>'' Then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  Else
    MEFilial.Text:='';
end;

procedure TFContasPagarCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons=Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal=mrOk then
    Begin
      MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    End;
end;

procedure TFContasPagarCons.MECodDeptoChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodDepto.Text)<>'' Then
    MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MECodDepto.Text)
  Else
    MEDepartamento.Text:='';
end;

procedure TFContasPagarCons.MECodClienteChange(Sender: TObject);
begin
  inherited;
  If Trim(MECodCliente.Text)<>'' Then
    MECadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCliente.Text)
  Else
    MECadastro.Text:='';


end;

procedure TFContasPagarCons.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons=Nil then
    FCadastroCons:=TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal=mrOk then
    Begin
      MECodCliente.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    End;
end;

procedure TFContasPagarCons.MeValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If Key = ',' Then
     Key := '.';
end;

procedure TFContasPagarCons.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'REMOVE' then
    with (Sender as TDBGrid) do
      with DMContasPagar do
      begin
        if (gdFocused in state) or (gdSelected in state) then
        begin
          Canvas.Brush.Color := clGray;
          Canvas.Font.Color := clWhite;
        end;
        if QContasPagar_CabConsIND_SITUACAO.Value = 'BAIXA TOTAL' then
          Canvas.Brush.Color := clGreen
        else if QContasPagar_CabConsDT_VENCIMENTO.Value < Date then
          Canvas.Brush.Color := clRed
        else if QContasPagar_CabConsDT_VENCIMENTO.Value = Date then
          Canvas.Brush.Color := clBlue;
        DefaultDrawColumnCell(Rect,DataCol,Column,state);
      end;
end;

procedure TFContasPagarCons.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'RAZENTE' then
     DbGrid1.Columns.Items[13].Index := 7;

end;

procedure TFContasPagarCons.SbProcuraNotaClick(Sender: TObject); //Apresenta os itens do titulo selecionado. Vanessa 21/03/2014
var
  x, y: array of string;
begin
  inherited;
   if DMContasPagar.QContasPagar_CabConsCOD_NOTA_CAB.Text <> '' then
   Begin
     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT COD_VENDEDOR FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagar_CabConsCod_Nota_Cab.Text;
     x[1] := 'SELECT DT_EMISSAO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagar_CabConsCod_Nota_Cab.Text;
     x[2] := 'SELECT COD_PRAZO_VENCIMENTO FROM TB_NOTA_CAB WHERE COD_NOTA_CAB =  '+DMContasPagar.QContasPagar_CabConsCod_Nota_Cab.Text;

     DMOracle.BuscaNomes(x, y);
     DMNotaSaida.QItemNfCons.Close;
     DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMContasPagar.QContasPagar_CabConsCod_Nota_Cab.Value);
     DMNotaSaida.QItemNfCons.Open;
     If FNotaItensCons = Nil Then
        FNotaItensCons := TFNotaItensCons.Create(application);
     FNotaItensCons.MeTexto.Text := Y[1];
     FNotaItensCons.MeVendedor.Text := Y[0];
     FNotaItensCons.MePagto.Text := Y[2];
     FNotaItensCons.ShowModal;
   End;
end;

end.
