unit UAtualizaEstoqueNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, ComCtrls, variants;

type
  TFAtualizaEstoqueNotas = class(TForm)
    MeFilial: TMaskEdit;
    Label24: TLabel;
    SpeedButton10: TSpeedButton;
    Me7Filial: TMaskEdit;
    Label1: TLabel;
    MeVendedor: TMaskEdit;
    SpeedButton1: TSpeedButton;
    MaskEdit2: TMaskEdit;
    Label8: TLabel;
    MEData: TMaskEdit;
    BtAtualiza: TBitBtn;
    BtCancel: TBitBtn;
    PB: TProgressBar;
    Label2: TLabel;
    MeNotaInicial: TMaskEdit;
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtAtualizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MeFilialChange(Sender: TObject);
    procedure MeVendedorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualizaEstoqueNotas: TFAtualizaEstoqueNotas;

implementation

uses UFilialCons, UEstoque_cl, UOracle_cl, UFilial_cl, UVendedorCons,
  UVendedor_cl, UUsuario_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFAtualizaEstoqueNotas.SpeedButton10Click(Sender: TObject);
begin
  If FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  If (FFilialCons.Showmodal=mrok) then
    Begin
      MEFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.value);
    End;

end;

procedure TFAtualizaEstoqueNotas.SpeedButton1Click(Sender: TObject);
begin
  If FVendedorCons=Nil then
    FVendedorCons:=TFVendedorCons.Create(Application);
  If (FVendedorCons.Showmodal=mrok) then
     MEVendedor.Text:=FloatToStr(DMVendedor.QVendedorConsCod_Vendedor.value);

end;

procedure TFAtualizaEstoqueNotas.BtAtualizaClick(Sender: TObject);
Var wCont, wFilial : Integer;
    wValor, wQuant : Real;
begin
   DmUsuario.Checar_Filial_Usuario( Trim(MEFilial.Text),'ESTOQUE');
   With DMEstoque do
   Begin
     QAtualizaEstoqueNotas.Close;
     QAtualizaEstoqueNotas.SetVariable('DATA_MOVIMENTO',MeData.Text);
     If Trim(MeVendedor.Text) <> '' Then
        QAtualizaEstoqueNotas.SetVariable('VENDEDOR',StrToInt(Trim(MeVendedor.Text)))
     Else
        QAtualizaEstoqueNotas.SetVariable('VENDEDOR',Null);
     If Trim(MeFilial.Text) <> '' Then
        QAtualizaEstoqueNotas.SetVariable('FILIAL',StrToInt(Trim(MeFilial.Text)))
     Else
        QAtualizaEstoqueNotas.SetVariable('FILIAL',Null);   
     If Trim(MENotaInicial.Text)<>'' then
        QAtualizaEstoqueNotas.SetVariable('NOTA_INICIAL',StrToInt(Trim(MeNotaInicial.Text)))
     Else
        QAtualizaEstoqueNotas.SetVariable('NOTA_INICIAL',Null);

     QAtualizaEstoqueNotas.Open;
     wCont := 0;
     PB.Max := QAtualizaEstoqueNotas.RecordCount;
     
     DMEstoque.QEstoqueAtualizado.Close;
     DMEstoque.QEstoqueAtualizado.SetVariable('DT_ESTOQUE_ATUALIZADO', strtodate(MEData.Text));
     DMEstoque.QEstoqueAtualizado.open;

     if DMEstoque.QEstoqueAtualizado.RecordCount >= 1 then
       raise Exception.create('Já foi feita a atualização de estoque nessa data');

     try
       DMOracle.DBCemapa.StartTransaction;

       QAtualizaEstoqueNotas.First;
       While Not QAtualizaEstoqueNotas.Eof Do
       Begin
         If QAtualizaEstoqueNotasInd_Tipo_Operacao.Value = 'E' Then
          Begin
            wQuant := QAtualizaEstoqueNotasQt_Quantidade.Value;
            wValor := QAtualizaEstoqueNotasVal_Total.Value
          End
         Else
          Begin
            wQuant := QAtualizaEstoqueNotasQt_Quantidade.Value * -1;
            wValor := QAtualizaEstoqueNotasVal_Total.Value * -1;
          End;
         If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
            wFilial := 1
         Else
            wFilial := QAtualizaEstoqueNotasCod_Filial.Value;
         DMEstoque.Atualiza_Estoque(QAtualizaEstoqueNotasCod_Operacao.Value,
                                    wFilial,
                                    QAtualizaEstoqueNotasCod_Produto.Value,
                                    QAtualizaEstoqueNotasCod_Lote_Tipo.Value,
                                    wQuant,
                                    wValor,
                                    QAtualizaEstoqueNotasDt_Emissao.Value,
                                    QAtualizaEstoqueNotasDt_Emissao.Value);
         QAtualizaEstoqueNotas.Next;
         Inc(wCont);
         PB.Position := wCont;
       End;

       DMEstoque.QEstoqueAtualizado.Insert;
       DMEstoque.QEstoqueAtualizadoDT_ESTOQUE_ATUALIZADO.Value := strtodate(MEData.Text);
       DMEstoque.QEstoqueAtualizado.post;

       MessageDlg('Estoque Atualizado Com Sucesso', mtInformation,[mbOk], 0);
       PB.Position := 0;
       DMOracle.DBCemapa.Commit;
     except
       DMOracle.DBCemapa.Rollback;
       raise;
     end;
   End;
end;

procedure TFAtualizaEstoqueNotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FAtualizaEstoqueNotas := Nil;
end;

procedure TFAtualizaEstoqueNotas.MeFilialChange(Sender: TObject);
begin
  If TRIM(MeFilial.Text) <> '' Then
    Me7Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + TRIM(MeFilial.Text) );
end;

procedure TFAtualizaEstoqueNotas.MeVendedorChange(Sender: TObject);
begin
  If TRIM(MeVendedor.Text) <> '' Then
    MaskEdit2.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + TRIM(MeVendedor.Text) );
end;

end.
